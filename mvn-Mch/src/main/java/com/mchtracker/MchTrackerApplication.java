package com.mchtracker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Main entry point for the Maternal & Child Health Tracker application.
 * @EnableScheduling enables the @Scheduled tasks (multithreading / reminders).
 */
@SpringBootApplication
@EnableScheduling
public class MchTrackerApplication {

    public static void main(String[] args) {
        SpringApplication.run(MchTrackerApplication.class, args);
        System.out.println("==============================================");
        System.out.println("  Maternal & Child Health Tracker Started!   ");
        System.out.println("  Open: http://localhost:8090/login           ");
        System.out.println("==============================================");
    }
}
