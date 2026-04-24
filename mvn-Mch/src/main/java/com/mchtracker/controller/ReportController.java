package com.mchtracker.controller;

import com.mchtracker.service.ChildService;
import com.mchtracker.service.ImmunizationService;
import com.mchtracker.service.MotherService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles the Reports page with summary statistics.
 */
@Controller
@RequestMapping("/reports")
public class ReportController {

    @Autowired
    private MotherService motherService;

    @Autowired
    private ChildService childService;

    @Autowired
    private ImmunizationService immunizationService;

    @GetMapping
    public String showReports(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";

        // Summary counts
        model.addAttribute("totalMothers", motherService.countMothers());
        model.addAttribute("totalChildren", childService.countChildren());
        model.addAttribute("totalImmunizations", immunizationService.countImmunizations());
        model.addAttribute("pendingImmunizations", immunizationService.countPending());

        // All records for detailed table
        model.addAttribute("mothers", motherService.getAllMothers());
        model.addAttribute("allImmunizations", immunizationService.getAllImmunizations());
        model.addAttribute("upcomingVaccines", immunizationService.getUpcomingImmunizations(30));

        return "reports";
    }
}
