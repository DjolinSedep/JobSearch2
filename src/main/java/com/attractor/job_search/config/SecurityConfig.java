package com.attractor.job_search.config;


import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.ALWAYS))
                .httpBasic(Customizer.withDefaults())
                .formLogin(form -> form
                        .loginPage("/auth/login")
                        .loginProcessingUrl("/auth/login")
                        .successHandler((request, response, authentication) -> {
                            var authorities = authentication.getAuthorities();
                            if (authorities.contains(new SimpleGrantedAuthority("ROLE_EMPLOYEE"))) {
                                response.sendRedirect("/resumes");
                            } else if (authorities.contains(new SimpleGrantedAuthority("ROLE_APPLICANT"))) {
                                response.sendRedirect("/vacancies");
                            } else {
                                response.sendRedirect("/");
                            }
                        })
                        .failureUrl("/auth/login?error=true")
                        .permitAll())
                .logout(logout -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                        .permitAll())
                .authorizeHttpRequests(request -> request
                        .requestMatchers("/resumes/create").hasRole("APPLICANT")
                        .requestMatchers("/resumes/edit/**").hasRole("APPLICANT")
                        .requestMatchers("/resumes/{id}").hasRole("EMPLOYEE")
                        .requestMatchers("/resumes").hasRole("EMPLOYEE")
                        .requestMatchers("/vacancies").permitAll()
                        .requestMatchers("/vacancies/{id}").permitAll()
                        .requestMatchers("/vacancies/create").hasRole("EMPLOYEE")
                        .requestMatchers("/vacancies/edit/**").hasRole("EMPLOYEE")
                        .requestMatchers("/vacancies/update/**").hasRole("EMPLOYEE")
                        .requestMatchers("/users/**").authenticated()
                        .anyRequest().permitAll());
        return http.build();
    }

}
