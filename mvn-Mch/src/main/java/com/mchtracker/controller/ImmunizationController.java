package com.mchtracker.controller;

import com.mchtracker.model.Immunization;
import com.mchtracker.service.ChildService;
import com.mchtracker.service.ImmunizationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Handles all Immunization-related web requests.
 */
@Controller
@RequestMapping("/immunizations")
public class ImmunizationController {

    @Autowired
    private ImmunizationService immunizationService;

    @Autowired
    private ChildService childService;

    /** List all immunization records */
    @GetMapping
    public String listImmunizations(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("immunizations", immunizationService.getAllImmunizations());
        return "immunizations";
    }

    /** Show Add Immunization form */
    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("immunization", new Immunization());
        model.addAttribute("children", childService.getAllChildren());
        return "addImmunization";
    }

    /** Process Add Immunization form */
    @PostMapping("/add")
    public String saveImmunization(@ModelAttribute Immunization immunization,
                                   @RequestParam Long childId,
                                   HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        immunizationService.saveImmunization(immunization, childId);
        return "redirect:/immunizations?success=true";
    }

    /** Delete an immunization record */
    @GetMapping("/delete/{id}")
    public String deleteImmunization(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        immunizationService.deleteImmunization(id);
        return "redirect:/immunizations?deleted=true";
    }
}
