package com.attractor.job_search.controller;

import com.attractor.job_search.dto.UserDto;
import com.attractor.job_search.dto.UserEditDto;
import com.attractor.job_search.dto.VacancyDto;
import com.attractor.job_search.service.RespondedApplicantService;
import com.attractor.job_search.service.ResumeService;
import com.attractor.job_search.service.UserService;
import com.attractor.job_search.service.VacancyService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import java.io.IOException;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("users")
public class UserController {
    private final UserService userService;
    private final ResumeService resumeService;
    private final VacancyService vacancyService;
    private final RespondedApplicantService respondedApplicantService;

    @GetMapping("edit")
    public String editProfile(Model model) {
        model.addAttribute("user", userService.getAuthenticatedUserDto());
        model.addAttribute("editedUser", userService.getUserEditDto());
        return "user/profile_edit";
    }

    @PostMapping("edit")
    public String editProfile(@Valid @ModelAttribute("editedUser") UserEditDto userEditDto, BindingResult bindingResult, Model model) {
        try {
            if (!bindingResult.hasErrors()) {
                userService.editUser(userEditDto);
                return "redirect:/users/profile";
            }
            model.addAttribute("user", userService.getAuthenticatedUserDto());
            return "user/profile_edit";
        } catch (IOException e){
            model.addAttribute("user", userService.getAuthenticatedUserDto());
            model.addAttribute("error", e.getMessage());
            return "user/profile_edit";
        }

    }

    @GetMapping("{userId}")
    public String getUserProfile(Model model,
                                 @PathVariable Long userId,
                                 @PageableDefault(size = 4) Pageable pageable) {
        UserDto user = userService.getUserDtoById(userId);

        if(Objects.equals(user.getRole(), "ROLE_APPLICANT")) {
            model.addAttribute("resumes", resumeService.getResumesByApplicantId(userId, pageable));
        } else if (Objects.equals(user.getRole(), "ROLE_EMPLOYEE")) {
            model.addAttribute("vacancies", vacancyService.getVacanciesByAuthorId(userId, pageable));
        }
        model.addAttribute("user", user);
        return "user/users_profile";
    }

    @GetMapping("profile")
    public String getProfile(Model model,
                             @RequestParam(value = "sort", required = false, defaultValue = "updateTime") String sortField,
                             @PageableDefault(size = 4) Pageable pageable) {

        UserDto authenticatedUser = userService.getAuthenticatedUserDto();
        model.addAttribute("user", authenticatedUser);
        if (authenticatedUser.getRole().equals("ROLE_APPLICANT")) {
            model.addAttribute("resumes", resumeService.getResumesByApplicantId(authenticatedUser.getId(), pageable));
            model.addAttribute("responsesForApplicant", respondedApplicantService.getResponsesByResume(authenticatedUser.getId()));
        }
        else {
            Sort sort = Sort.by(Sort.Direction.DESC, sortField);
            Pageable pageableWithSort = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), sort);
            Page<VacancyDto> vacancies = vacancyService.getVacanciesByAuthorId(authenticatedUser.getId(), pageableWithSort);
            model.addAttribute("vacancies", vacancies);
            model.addAttribute("responsesForCompany", respondedApplicantService.getResponsesByVacancy(authenticatedUser.getId()));
        }
        return "user/profile";
    }


}
