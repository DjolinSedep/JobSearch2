package com.attractor.job_search.service.impl;

import com.attractor.job_search.common.Utilities;
import com.attractor.job_search.dto.UserDto;
import com.attractor.job_search.dto.UserEditDto;
import com.attractor.job_search.dto.UserRegistrationDto;
import com.attractor.job_search.model.Role;
import com.attractor.job_search.model.User;
import com.attractor.job_search.repository.UserRepository;
import com.attractor.job_search.service.ImageService;
import com.attractor.job_search.service.RoleService;
import com.attractor.job_search.service.UserService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.LocaleResolver;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;
    private final ImageService imageService;
    private final EmailService emailService;

    @Override
    public void registerNewUser(UserRegistrationDto registrationDto) {
        if (checkUserExistingByEmail(registrationDto.getEmail())) {
            throw new IllegalArgumentException("Пользователь с указанным email уже существует");
        }
        User user = new User();
        user.setName(registrationDto.getName());
        user.setSurname(registrationDto.getSurname());
        user.setAge(registrationDto.getAge());
        user.setEmail(registrationDto.getEmail());
        user.setPassword(passwordEncoder.encode(registrationDto.getPassword()));
        user.setPhoneNumber(registrationDto.getPhoneNumber());
        user.setEnabled(true);
        user.setAvatar("default_avatar.png");
        System.out.println(registrationDto.getAccountType());

        Role role;
        if ("ROLE_EMPLOYEE".equals(registrationDto.getAccountType())) {
            role = roleService.findRoleByName("ROLE_EMPLOYEE");
        } else {
            role = roleService.findRoleByName("ROLE_APPLICANT");
        }

        user.setRole(role);
        role.getUsers().add(user);

        userRepository.save(user);
    }

    private boolean checkUserExistingByEmail(String email){
        return userRepository.findByEmail(email).isPresent();
    }

    @Override
    public void editUser(UserEditDto editDto) throws IOException {
        User user = getUserByEmail(getAuthenticatedUser().getEmail());
        if (editDto.getAvatar() != null && !editDto.getAvatar().isEmpty()) {
            String avatar = imageService.uploadAvatar(user.getId(), editDto.getAvatar());
            user.setAvatar(avatar);
            log.info("Image uploaded");
        }
        user.setName(editDto.getName());
        user.setSurname(editDto.getSurname());
        user.setPhoneNumber(editDto.getPhoneNumber());
        userRepository.save(user);
    }


    @Override
    public User getUserByEmail(String email){
        return userRepository.findByEmail(email).orElseThrow(()->new NoSuchElementException("User not found"));
    }

    @Override
    public UserDto getUserDtoById(Long userId){
        return convertToDto(getUserById(userId));
    }

    @Override
    public User getUserById(Long userId){
        return userRepository.findById(userId).orElseThrow(()->new NoSuchElementException("User not found"));
    }

    @Override
    public Map<String, Object> forgotPassword(HttpServletRequest request){
        Map<String, Object> model = new HashMap<>();
        try {
            makeResetPasswordLink(request);
            model.put("message", "Мы отправили ссылку для изменения пароля на ваш email");
        } catch (UsernameNotFoundException | UnsupportedEncodingException e){
            model.put("error", e.getMessage());
        } catch (MessagingException e){
            model.put("error", "Ошибка при отправке ссылки на ваш email");
        }
        return model;
    }

    private void makeResetPasswordLink(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
        String email = request.getParameter("email");
        String token = UUID.randomUUID().toString();
        updateToken(token, email);

        String resetPasswordLink = Utilities.getSiteUrl(request) + "/auth/reset_password?token=" + token;
        emailService.sendMail(email, resetPasswordLink);

    }

    private void updateToken(String token, String email){
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Could not find any user with the email: " + email));
        user.setResetPasswordToken(token);
        userRepository.save(user);
    }

    @Override
    public Map<String, Object> resetPasswordGet(String token) {
        Map<String, Object> model = new HashMap<>();
        try {
            getByToken(token);
            model.put("token", token);
        } catch (UsernameNotFoundException e) {
            model.put("error", "Invalid token");
        }
        return model;
    }

    private User getByToken(String token){
        return userRepository.findByResetPasswordToken(token)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    }


    @Override
    public Map<String, Object> resetPasswordPost(HttpServletRequest request) {
        Map<String, Object> model = new HashMap<>();
        String token = request.getParameter("token");
        String password = request.getParameter("password");


        List<String> validationErrors = validatePassword(password);
        if (!validationErrors.isEmpty()) {
            model.put("message", "Ошибка валидации пароля:");
            model.put("errors", validationErrors);
            return model;
        }

        try {
            User user = getByToken(token);
            updatePassword(user, password);
            model.put("message", "Пароль успешно изменен.");
        } catch (UsernameNotFoundException e) {
            model.put("message", "Invalid token");
        }
        return model;
    }

    private void updatePassword(User user, String password){
        user.setPassword(passwordEncoder.encode(password));
        user.setResetPasswordToken(null);
        userRepository.save(user);
    }



    private List<String> validatePassword(String password) {
        List<String> errors = new ArrayList<>();

        if (password == null || password.isEmpty()) {
            errors.add("Пароль не может быть пустым.");
            return errors;
        }

        if (password.length() < 8) {
            errors.add("Пароль должен содержать не менее 8 символов.");
        }

        if (!password.matches(".*[A-Z].*")) {
            errors.add("Пароль должен содержать хотя бы одну заглавную букву.");
        }

        if (!password.matches(".*[a-z].*")) {
            errors.add("Пароль должен содержать хотя бы одну строчную букву.");
        }

        if (!password.matches(".*\\d.*")) {
            errors.add("Пароль должен содержать хотя бы одну цифру.");
        }

        return errors;
    }


    @Override
    public void determineLocaleForUser(HttpServletRequest request, HttpServletResponse response, LocaleResolver localeResolver){
        log.info("determineLocaleForUser called");
        User user = getAuthenticatedUser();
        if (user != null) {
            String lang = request.getParameter("lang");
            if (lang != null) {
                Locale locale = Locale.forLanguageTag(lang);
                localeResolver.setLocale(request, response, locale);
                user.setInterfaceLanguage(lang);
            } else if (user.getInterfaceLanguage() != null) {
                Locale locale = Locale.forLanguageTag(user.getInterfaceLanguage());
                localeResolver.setLocale(request, response, locale);
            } else {
                Locale defaultLocale = Locale.forLanguageTag("en");
                localeResolver.setLocale(request, response, defaultLocale);
                user.setInterfaceLanguage("en");
            }
            userRepository.save(user);
        }
    }



    @Override
    public UserEditDto getUserEditDto(){
        User user = getAuthenticatedUser();
        return UserEditDto.builder()
                .id(user.getId())
                .email(user.getEmail())
                .name(user.getName())
                .surname(user.getSurname())
                .phoneNumber(user.getPhoneNumber())
                .role(user.getRole().getRoleName())
                .avatarFileName(user.getAvatar())
                .build();
    }


    @Override
    public UserDto getAuthenticatedUserDto(){
        return convertToDto(getAuthenticatedUser());
    }

    @Override
    public User getAuthenticatedUser(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken){
            return null;
        }
        return getUserByEmail(auth.getName());
    }

    @Override
    public UserDto convertToDto(User user){
        return UserDto.builder()
                .id(user.getId())
                .name(user.getName())
                .surname(user.getSurname())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNumber())
                .avatar(user.getAvatar())
                .age(user.getAge())
                .interfaceLanguage(user.getInterfaceLanguage())
                .role(user.getRole().getRoleName())
                .build();
    }



}
