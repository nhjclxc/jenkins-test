package com.example.jenkinstest.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * @author LuoXianchao
 * @since 2024/04/13 19:54
 */
@RestController
@RequestMapping("/testCon")
public class TestController {

    @Value("${server.port}")
    private String port;
    @Value("${spring.application.name}")
    private String appName;

    @GetMapping("/test1")
    public Object test1(){
        String str = "更新2,  " + LocalDateTime.now() + ",, port=" + port + ", appName = " + appName;
        System.out.println(str);
        return str;
    }
}
