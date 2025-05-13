package com.attractor.job_search.controller;

import com.attractor.job_search.dto.UserDto;
import com.attractor.job_search.dto.VacancyDto;
import com.attractor.job_search.service.CategoryService;
import com.attractor.job_search.service.UserService;
import com.attractor.job_search.service.VacancyService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;



@Controller
@RequiredArgsConstructor
@RequestMapping("vacancies")
public class VacancyController {
    private final VacancyService vacancyService;
    private final CategoryService categoryService;
    private final UserService userService;


    @GetMapping()
    public String getVacancies(Model model,
                               @RequestParam(value = "sort", required = false, defaultValue = "updateTime") String sortField,
                               @RequestParam(value = "category", required = false) Long categoryId,
                               @RequestParam(value = "search", required = false) String searchTerm,
                               @PageableDefault(size = 20) Pageable pageable) {

        Page<VacancyDto> vacancies = vacancyService.getFilteredVacancies(
                categoryId, sortField, searchTerm, pageable);

        model.addAttribute("vacancies", vacancies);
        model.addAttribute("categories", categoryService.getAllCategories());

        return "vacancies/vacancies";
    }


    @GetMapping("create")
    public String createVacancy(Model model) {
        model.addAttribute("vacancyDto", new VacancyDto());
        model.addAttribute("categories", categoryService.getAllCategories());
        return "vacancies/vacancy_create";
    }

    @PostMapping("create")
    public String createVacancy(@Valid VacancyDto vacancyDto, BindingResult bindingResult, Model model) {
        try {
            if (!bindingResult.hasErrors()) {
                vacancyService.create(vacancyDto);
                return "redirect:/users/profile";
            }
            model.addAttribute("vacancyDto", vacancyDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "vacancies/vacancy_create";
        } catch (IllegalArgumentException e){
            model.addAttribute("error", e.getMessage());
            model.addAttribute("vacancyDto", vacancyDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "vacancies/vacancy_create";
        }
    }


    @GetMapping("edit/{vacancyId}")
    public String editVacancy(@PathVariable Long vacancyId, Model model) {
        VacancyDto vacancyDto = vacancyService.getVacancyDtoById(vacancyId);
        UserDto userDto = userService.getAuthenticatedUserDto();
        if(!vacancyDto.getAuthorEmail().equals(userDto.getEmail())) {
            return "redirect:/users/profile";
        }
        model.addAttribute("vacancyDto", vacancyDto);
        model.addAttribute("categories", categoryService.getAllCategories());
        return "vacancies/vacancy_edit";
    }


    @PostMapping("edit/{vacancyId}")
    public String editVacancy(@PathVariable Long vacancyId, @Valid VacancyDto vacancyDto, BindingResult bindingResult, Model model) {
        try {
            if (!bindingResult.hasErrors()) {
                vacancyDto.setId(vacancyId);
                vacancyService.edit(vacancyDto);
                return "redirect:/users/profile";
            }
            vacancyDto.setId(vacancyId);
            model.addAttribute("vacancyDto", vacancyDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "vacancies/vacancy_edit";

        } catch (IllegalArgumentException e){
            vacancyDto.setId(vacancyId);
            model.addAttribute("error", e.getMessage());
            model.addAttribute("vacancyDto", vacancyDto);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "vacancies/vacancy_edit";
        }
    }

    @PostMapping("update/{vacancyId}")
    public String updateVacancy(@PathVariable Long vacancyId, @Valid VacancyDto vacancyDto, Model model) {
        try {
            vacancyService.updateVacancyTime(vacancyId);
            return "user/profile";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "user/profile";
        }
    }


    @GetMapping("{vacancyId}")
    public String getVacancyById(@PathVariable Long vacancyId, Model model) {
        model.addAttribute("vacancy", vacancyService.getVacancyDtoById(vacancyId));
        return "vacancies/vacancy_detail";
    }



}
