package com.ma.disaster;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@MapperScan("com.ma.disaster.mapper")
@CrossOrigin
public class DisasterApplication {

    public static void main(String[] args) {
        SpringApplication.run(DisasterApplication.class, args);
    }


}
