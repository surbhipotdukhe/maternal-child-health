package com.mchtracker.controller;

import com.mchtracker.service.ChildService;
import com.mchtracker.service.ImmunizationService;
import com.mchtracker.service.MotherService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller for the main Dashboard page.
 * Displays overall statistics.
 */
@Controller
public class DashboardController {

    @Autowired
    private MotherService motherService;

    @Autowired
    private ChildService childService;

    @Autowired
    private ImmunizationService immunizationService;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        // Check if user is logged in
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }

        // Pass stats to the view
        model.addAttribute("totalMothers", motherService.countMothers());
        model.addAttribute("totalChildren", childService.countChildren());
        model.addAttribute("totalImmunizations", immunizationService.countImmunizations());
        model.addAttribute("pendingImmunizations", immunizationService.countPending());

        // Recent upcoming immunizations (next 7 days)
        model.addAttribute("upcomingVaccines", immunizationService.getUpcomingImmunizations(7));

        return "dashboard";
    }
}
