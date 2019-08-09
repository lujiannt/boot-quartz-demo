package com.test.module_schedule.service;

import com.test.module_schedule.entity.ScheduleLog;

public interface LogService {
    /**
     * 新增日志
     *
     * @param log
     * @return
     */
    int addScheduleLog(ScheduleLog log);
}
