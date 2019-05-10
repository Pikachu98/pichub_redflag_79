package com.pichub.hello.service.impl;

import com.pichub.hello.service.impl.DoTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Configuration      //1.主要用于标记配置类，兼备Component的效果。
public class SaticScheduleTask {
    @Autowired
    DoTagService doTagService;
    //3.添加定时任务
    //@Scheduled(cron = "0/5 * * * * ?")
    //或直接指定时间间隔，例如：5秒
    @Scheduled(fixedRate=600000)
    private void configureTasks() throws Exception{
        doTagService.doTag();
        //System.err.println("执行静态定时任务时间: " + LocalDateTime.now());
    }
}
