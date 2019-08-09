package com.test.module_schedule;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.test.module_schedule.mapper")
public class ModuleScheduleApplication {

    public static void main(String[] args) {
        SpringApplication.run(ModuleScheduleApplication.class, args);
    }

}
