package com.mchtracker.controller;

import com.mchtracker.model.Child;
import com.mchtracker.service.ChildService;
import com.mchtracker.service.MotherService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Handles all Child-related web requests.
 */
@Controller
@RequestMapping("/children")
public class ChildController {

    @Autowired
    private ChildService childService;

    @Autowired
    private MotherService motherService;

    /** List all children */
    @GetMapping
    public String listChildren(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("children", childService.getAllChildren());
        return "children";
    }

    /** Show Add Child form */
    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("child", new Child());
        model.addAttribute("mothers", motherService.getAllMothers());
        return "addChild";
    }

    /** Process Add Child form */
    @PostMapping("/add")
    public String saveChild(@ModelAttribute Child child,
                            @RequestParam Long motherId,
                            HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        childService.saveChild(child, motherId);
        return "redirect:/children?success=true";
    }

    /** Delete a child */
    @GetMapping("/delete/{id}")
    public String deleteChild(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        childService.deleteChild(id);
        return "redirect:/children?deleted=true";
    }
}
