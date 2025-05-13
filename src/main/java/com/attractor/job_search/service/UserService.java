package com.attractor.job_search.service;

import com.attractor.job_search.dto.UserDto;
import com.attractor.job_search.dto.UserEditDto;
import com.attractor.job_search.dto.UserRegistrationDto;
import com.attractor.job_search.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.LocaleResolver;

import java.io.IOException;
import java.util.Map;

public interface UserService {
    void registerNewUser(UserRegistrationDto registrationDto);

    void editUser(UserEditDto editDto) throws IOException;

    User getUserByEmail(String email);

    UserDto getUserDtoById(Long userId);

    User getUserById(Long userId);

    Map<String, Object> forgotPassword(HttpServletRequest request);

    Map<String, Object> resetPasswordGet(String token);

    Map<String, Object> resetPasswordPost(HttpServletRequest request);

    void determineLocaleForUser(HttpServletRequest request, HttpServletResponse response, LocaleResolver localeResolver);

    UserEditDto getUserEditDto();

    UserDto getAuthenticatedUserDto();

    User getAuthenticatedUser();

    UserDto convertToDto(User user);
}
