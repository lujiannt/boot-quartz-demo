package com.test.module_schedule.entity;


/**
 * 定时任务
 */
public class ScheduleJob {
    /**
     * 状态-禁用
     */
    public final static String STATUS_DISABLE = "0";
    /**
     * 状态-启用
     */
    public final static String STATUS_NORMAL = "1";
    /**
     * 状态-暂停
     */
    public final static String STATUS_PAUSE = "2";

    /**
     * 任务ID
     */
    private String jobId;
    /**
     * 任务名称
     */
    private String jobName;
    /**
     * 任务分组
     */
    private String jobGroup;
    /**
     * 任务状态 0禁用 1启用 2删除
     */
    private String jobStatus;
    /**
     * 任务运行时间表达式
     */
    private String cronExpression;
    /**
     * 任务描述
     */
    private String description;
    /**
     * 任务类
     */
    private String targetObject;
    /**
     * 任务方法
     */
    private String targetMethod;
    /**
     * 是否是Spring中定义的Bean
     */
    private String isSpringBean;
    /**
     * 如果isSpringBean = 0需要设置全类名,测试CLAZZ字段需要配置
     */
    private String clazz;
    /**
     * 是否并发 0禁用 1启用
     */
    private String concurrent;
    /**
     * 一系列的子任务,逗号分开,表示该任务执行完，之后需要执行的任务
     */
    private String childJobs;

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }

    public String getJobStatus() {
        return jobStatus;
    }

    public void setJobStatus(String jobStatus) {
        this.jobStatus = jobStatus;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTargetObject() {
        return targetObject;
    }

    public void setTargetObject(String targetObject) {
        this.targetObject = targetObject;
    }

    public String getTargetMethod() {
        return targetMethod;
    }

    public void setTargetMethod(String targetMethod) {
        this.targetMethod = targetMethod;
    }

    public String getIsSpringBean() {
        return isSpringBean;
    }

    public void setIsSpringBean(String isSpringBean) {
        this.isSpringBean = isSpringBean;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getConcurrent() {
        return concurrent;
    }

    public void setConcurrent(String concurrent) {
        this.concurrent = concurrent;
    }

    public String getChildJobs() {
        return childJobs;
    }

    public void setChildJobs(String childJobs) {
        this.childJobs = childJobs;
    }

    @Override
    public String toString() {
        return "ScheduleJob{" +
                "jobId='" + jobId + '\'' +
                ", jobName='" + jobName + '\'' +
                ", jobGroup='" + jobGroup + '\'' +
                ", jobStatus='" + jobStatus + '\'' +
                ", cronExpression='" + cronExpression + '\'' +
                ", description='" + description + '\'' +
                ", targetObject='" + targetObject + '\'' +
                ", targetMethod='" + targetMethod + '\'' +
                ", isSpringBean='" + isSpringBean + '\'' +
                ", clazz='" + clazz + '\'' +
                ", concurrent='" + concurrent + '\'' +
                ", childJobs='" + childJobs + '\'' +
                '}';
    }
}
