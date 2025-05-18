package com.attractor.job_search.controller;

import com.attractor.job_search.dto.ResumeDto;
import com.attractor.job_search.dto.UserDto;
import com.attractor.job_search.service.CategoryService;
import com.attractor.job_search.service.ResumeService;
import com.attractor.job_search.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Controller
@RequiredArgsConstructor
@RequestMapping("resumes")
public class ResumeController {
    private final ResumeService resumeService;
    private final CategoryService categoryService;
    private final UserService userService;

    @GetMapping()
    public String getResumes(Model model, @PageableDefault(size = 5) Pageable pageable) {
        Page<ResumeDto> resumes = resumeService.getAllResumes(pageable);
        model.addAttribute("resumes", resumes);
        return "/resumes/resumes";
    }

    @GetMapping("{resumeId}")
    public String getResumeById(Model model, @PathVariable("resumeId") Long resumeId) {
        model.addAttribute("resumeDto", resumeService.getResumeDtoById(resumeId));
        return "resumes/resume_detail";
    }

    @GetMapping("create")
    public String createResume(Model model) {
        model.addAttribute("resumeDto", new ResumeDto());
        model.addAttribute("categories", categoryService.getAllCategories());
        return "/resumes/resume_create";
    }

    @PostMapping("create")
    public String createResume(@Valid ResumeDto resumeDto, BindingResult bindingResult, Model model) {
        try {
            if (!bindingResult.hasErrors()) {
                Locale locale = LocaleContextHolder.getLocale();
                resumeService.create(resumeDto, locale);
                return "redirect:/users/profile";
            }
            model.addAttribute("resumeDto", resumeDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "/resumes/resume_create";
        } catch (IllegalArgumentException e) {
            model.addAttribute("resumeDto", resumeDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            model.addAttribute("error", e.getMessage());
            return "/resumes/resume_create";
        }
    }

    @GetMapping("edit/{id}")
    public String editResume(@PathVariable Long id, Model model) {
        ResumeDto resumeDto = resumeService.getResumeDtoById(id);
        UserDto userDto = userService.getAuthenticatedUserDto();
        if(!resumeDto.getUserEmail().equals(userDto.getEmail())) {
            return "redirect:/users/profile";
        }
        model.addAttribute("resumeDto", resumeDto);
        model.addAttribute("categories", categoryService.getAllCategories());
        return "/resumes/resume_edit";
    }

    @PostMapping("edit/{id}")
    public String editResume(@PathVariable Long id, @Valid ResumeDto resumeDto, BindingResult bindingResult, Model model) {
        try{
            if (!bindingResult.hasErrors()){
                Locale locale = LocaleContextHolder.getLocale();
                resumeDto.setId(id);
                resumeService.edit(resumeDto, locale);
                return "redirect:/users/profile";
            }
            model.addAttribute("resumeDto", resumeDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "/resumes/resume_edit";
        } catch (IllegalArgumentException e){
            model.addAttribute("resumeDto", resumeDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            model.addAttribute("error", e.getMessage());
            return "/resumes/resume_edit";
        }

    }



}
