package com.mchtracker.controller;

import com.mchtracker.model.User;
import com.mchtracker.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Handles Login and Logout operations.
 */
@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    /** Show Login Page */
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    /** Root URL redirects to login */
    @GetMapping("/")
    public String root() {
        return "redirect:/login";
    }

    /** Process Login Form */
    @PostMapping("/login")
    public String processLogin(@RequestParam String username,
                               @RequestParam String password,
                               HttpSession session,
                               Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password. Please try again.");
            return "login";
        }
    }

    /** Logout - invalidate session */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout=true";
    }
}
