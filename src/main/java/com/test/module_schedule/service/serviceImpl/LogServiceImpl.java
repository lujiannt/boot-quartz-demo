package com.test.module_schedule.service.serviceImpl;

import com.test.module_schedule.entity.ScheduleLog;
import com.test.module_schedule.mapper.LogMapper;
import com.test.module_schedule.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("logService")
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public int addScheduleLog(ScheduleLog log) {
        return logMapper.insertLog(log);
    }
}
