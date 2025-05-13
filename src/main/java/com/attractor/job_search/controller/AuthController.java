package com.attractor.job_search.controller;


import com.attractor.job_search.dto.UserRegistrationDto;
import com.attractor.job_search.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.Map;

@Controller
@RequestMapping("auth")
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @GetMapping("login")
    public String login() {
        return "auth/login";
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("userRegistrationDto", new UserRegistrationDto());
        return "auth/register";
    }

    @PostMapping("register")
    public String register(@Valid UserRegistrationDto userDto, BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.registerNewUser(userDto);
                return "redirect:/auth/login";
            } catch (IllegalArgumentException e){
                model.addAttribute("userRegistrationDto", userDto);
                model.addAttribute("emailError", e.getMessage());
                return "auth/register";
            }
        }

        model.addAttribute("userRegistrationDto", userDto);
        return "auth/register";
    }

    @GetMapping("forgot_password")
    public String forgotPassword() {
        return "auth/forgot_password";
    }

    @PostMapping("forgot_password")
    public String forgotPassword(HttpServletRequest request, Model model) {
        Map<String, Object> attributes = userService.forgotPassword(request);
        if (attributes.containsKey("error")) {
            model.addAllAttributes(attributes);
            return "auth/forgot_password";
        }
        model.addAllAttributes(attributes);
        return "auth/reset_password";
    }

    @GetMapping("reset_password")
    public String resetPassword() {
        return "auth/reset_password";
    }

    @PostMapping("reset_password")
    public String resetPassword(HttpServletRequest request, Model model) {
        model.addAllAttributes(userService.resetPasswordPost(request));
        return "auth/message";
    }
}
