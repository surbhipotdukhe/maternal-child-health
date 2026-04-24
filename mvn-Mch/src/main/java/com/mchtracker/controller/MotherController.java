package com.mchtracker.controller;

import com.mchtracker.model.Mother;
import com.mchtracker.service.MotherService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Handles all Mother-related web requests.
 */
@Controller
@RequestMapping("/mothers")
public class MotherController {

    @Autowired
    private MotherService motherService;

    /** List all mothers */
    @GetMapping
    public String listMothers(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("mothers", motherService.getAllMothers());
        return "mothers";
    }

    /** Show Add Mother form */
    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("mother", new Mother());
        return "addMother";
    }

    /** Process Add Mother form */
    @PostMapping("/add")
    public String saveMother(@ModelAttribute Mother mother, HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        motherService.saveMother(mother);
        return "redirect:/mothers?success=true";
    }

    /** View a single mother's details */
    @GetMapping("/view/{id}")
    public String viewMother(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        Mother mother = motherService.getMotherById(id);
        if (mother == null) return "redirect:/mothers";
        model.addAttribute("mother", mother);
        return "viewMother";
    }

    /** Delete a mother */
    @GetMapping("/delete/{id}")
    public String deleteMother(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        motherService.deleteMother(id);
        return "redirect:/mothers?deleted=true";
    }
}
