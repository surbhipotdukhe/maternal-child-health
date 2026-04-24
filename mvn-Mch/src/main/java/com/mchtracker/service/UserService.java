package com.mchtracker.service;

import com.mchtracker.model.User;
import com.mchtracker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

/**
 * Service class for User-related operations.
 * Handles authentication logic.
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    /**
     * Validates login by checking username and password.
     * Returns the User object if valid, else null.
     */
    public User login(String username, String password) {
        Optional<User> user = userRepository.findByUsername(username);
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            return user.get();
        }
        return null;
    }

    /**
     * Saves a new user to the database.
     */
    public void saveUser(User user) {
        userRepository.save(user);
    }

    /**
     * Checks if a default admin user exists; if not, creates one.
     * Called on application startup via DataInitializer.
     */
    public void createDefaultAdminIfNotExists() {
        Optional<User> admin = userRepository.findByUsername("admin");
        if (admin.isEmpty()) {
            User defaultAdmin = new User("admin", "admin123", "ADMIN");
            userRepository.save(defaultAdmin);
            System.out.println("[INFO] Default admin created: admin / admin123");
        }
    }
}
