package com.example.jenkinstest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * @author LuoXianchao
 * @since 2024/04/13 19:54
 */
@RestController
@RequestMapping
public class TestController {
    @GetMapping("/test1")
    public Object test1(){
        String str = "test 999   " + LocalDateTime.now();
        System.out.println("test1被请求, " + str);
        return str;
    }
}
