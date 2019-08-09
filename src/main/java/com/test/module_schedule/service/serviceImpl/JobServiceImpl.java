package com.test.module_schedule.service.serviceImpl;

import com.test.module_schedule.entity.ScheduleJob;
import com.test.module_schedule.mapper.JobMapper;
import com.test.module_schedule.service.JobService;
import org.apache.commons.lang.StringUtils;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.List;

@Service("jobService")
public class JobServiceImpl implements JobService {
    @Autowired
    private Scheduler scheduler;
    @Autowired
    private JobMapper jobMapper;

    /**
     * 初始化定时器
     */
    @PostConstruct
    public void inintScheduleJob() {
        //初始化任务
        System.out.println("start schedule job...");
        List<ScheduleJob> jobs = jobMapper.selectJobs();
        if (jobs.size() > 0) {
            try {
                //启动调度器
                scheduler.start();

                for (ScheduleJob job : jobs) {
                    if (job.getJobStatus().equals(ScheduleJob.STATUS_NORMAL)) {
                        //判断是否已存在
                        JobDetail oldDetail = scheduler.getJobDetail(JobKey.jobKey(job.getClazz(), job.getJobGroup()));
                        if (oldDetail == null) {
                            Class<? extends Job> clazz = null;
                            clazz = (Class<? extends Job>) Class.forName("com.test.module_schedule.task." + job.getClazz());
                            JobDetail jobDetail = JobBuilder.newJob(clazz)
                                    .withIdentity(job.getClazz(), job.getJobGroup()).build();

                            // 表达式调度构建器(即任务执行的时间)
                            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

                            // 按新的cronExpression表达式构建一个新的trigger
                            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(job.getClazz(), job.getJobGroup())
                                    .withSchedule(scheduleBuilder).build();

                            scheduler.scheduleJob(jobDetail, trigger);
                        }
                        System.out.println("jobId : " + job.getJobId() + " start excute...");
                    }
                }
            } catch (SchedulerException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public ScheduleJob getScheduleJobByName(String name) {
        ScheduleJob job = null;
        if (StringUtils.isNotBlank(name)) {
            job = jobMapper.selectJobByName(name);
        }
        return job;
    }

    @Override
    public List<ScheduleJob> listScheduleJob() {
        return jobMapper.selectJobs();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean addJob(ScheduleJob job) {
        boolean flag = false;

        //保存到数据库
        int res = jobMapper.insertJob(job);
        //scheduler中保存
        if (res > 0) {
            try {
                //启动调度器
                scheduler.start();

                //构建job信息
                Class<? extends Job> clazz = (Class<? extends Job>) Class.forName("com.test.module_schedule.task." + job.getClazz());
                JobDetail jobDetail = JobBuilder.newJob(clazz)
                        .withIdentity(job.getClazz(), job.getJobGroup()).build();

                //表达式调度构建器(即任务执行的时间)
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

                //按新的cronExpression表达式构建一个新的trigger
                CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(job.getClazz(), job.getJobGroup())
                        .withSchedule(scheduleBuilder).build();

                scheduler.scheduleJob(jobDetail, trigger);
                System.out.println("创建定时任务成功");
                flag = true;
            } catch (SchedulerException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean pauseJob(String jobId) {
        boolean flag = false;

        //更新到数据库
        int res = jobMapper.updateJobToPause(jobId);
        //暂停
        if (res > 0) {
            ScheduleJob job = jobMapper.selectJobById(jobId);
            if (job != null) {
                try {
                    scheduler.pauseJob(JobKey.jobKey(job.getClazz(), job.getJobGroup()));
                    flag = true;
                } catch (SchedulerException e) {
                    e.printStackTrace();
                }
            } else {
                throw new RuntimeException("job is null..");
            }
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean resumejob(String jobId) {
        boolean flag = false;

        //更新到数据库
        int res = jobMapper.updateJobToEnable(jobId);
        if (res > 0) {
            ScheduleJob job = jobMapper.selectJobById(jobId);
            if (job != null) {
                try {
                    scheduler.resumeJob(JobKey.jobKey(job.getClazz(), job.getJobGroup()));
                    flag = true;
                } catch (SchedulerException e) {
                    e.printStackTrace();
                }
            } else {
                throw new RuntimeException("job is null..");
            }
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean modifyJob(ScheduleJob job) {
        boolean flag = false;

        //更新到数据库
        int res = jobMapper.updateJob(job);
        //scheduler中更新
        if (res > 0) {
            try {
                TriggerKey triggerKey = TriggerKey.triggerKey(job.getClazz(), job.getJobGroup());
                //表达式调度构建器
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

                CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

                //按新的cronExpression表达式重新构建trigger
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

                //按新的trigger重新设置job执行
                scheduler.rescheduleJob(triggerKey, trigger);
                flag = true;
            } catch (SchedulerException e) {
                System.out.println("更新定时任务失败" + e);
            }
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeJob(String jobId) {
        boolean flag = false;
        ScheduleJob job = jobMapper.selectJobById(jobId);

        if (job != null) {
            //逻辑删除
            int res = jobMapper.removeJob(jobId);
            if (res > 0) {
                try {
                    scheduler.pauseTrigger(TriggerKey.triggerKey(job.getClazz(), job.getJobGroup()));
                    scheduler.unscheduleJob(TriggerKey.triggerKey(job.getClazz(), job.getJobGroup()));
                    scheduler.deleteJob(JobKey.jobKey(job.getClazz(), job.getJobGroup()));
                    flag = true;
                } catch (SchedulerException e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean enableJob(String jobId) {
        boolean flag = false;

        //更新到数据库
        int res = jobMapper.updateJobToEnable(jobId);
        if (res > 0) {
            ScheduleJob job = jobMapper.selectJobById(jobId);
            if (job != null) {
                try {
                    //启动调度器
                    scheduler.start();

                    //构建job信息
                    Class<? extends Job> clazz = (Class<? extends Job>) Class.forName("com.test.module_schedule.task." + job.getClazz());
                    JobDetail jobDetail = JobBuilder.newJob(clazz)
                            .withIdentity(job.getClazz(), job.getJobGroup()).build();

                    //表达式调度构建器(即任务执行的时间)
                    CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

                    //按新的cronExpression表达式构建一个新的trigger
                    CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(job.getClazz(), job.getJobGroup())
                            .withSchedule(scheduleBuilder).build();

                    scheduler.scheduleJob(jobDetail, trigger);
                    System.out.println("创建定时任务成功");
                    flag = true;
                } catch (SchedulerException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            } else {
                throw new RuntimeException("job is null..");
            }
        }
        return flag;
    }
}
