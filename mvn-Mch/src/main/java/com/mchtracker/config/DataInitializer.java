package com.mchtracker.config;

import com.mchtracker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * DataInitializer runs on application startup.
 * Creates default admin user if no users exist.
 * Implements CommandLineRunner (runs after Spring context loads).
 */
@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserService userService;

    @Override
    public void run(String... args) throws Exception {
        // Create default admin user on startup
        userService.createDefaultAdminIfNotExists();
        System.out.println("[CONFIG] DataInitializer complete.");
        System.out.println("[CONFIG] Default Login --> Username: admin  |  Password: admin123");
    }
}
