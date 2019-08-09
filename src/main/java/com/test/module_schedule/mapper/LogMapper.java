package com.test.module_schedule.mapper;

import com.test.module_schedule.entity.ScheduleLog;
import org.springframework.stereotype.Repository;

@Repository
public interface LogMapper {
    int insertLog(ScheduleLog log);
}
