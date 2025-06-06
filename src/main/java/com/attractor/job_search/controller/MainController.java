package com.attractor.job_search.controller;

import com.attractor.job_search.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class MainController {
    private final CategoryService categoryService;

    @GetMapping
    public String homePage(Model model){
        model.addAttribute("categories", categoryService.getAllCategories());
        return "home_page";
    }
}
