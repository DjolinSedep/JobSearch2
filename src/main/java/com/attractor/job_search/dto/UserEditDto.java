package com.attractor.job_search.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserEditDto {
    private Long id;
    @NotBlank(message = "Заполните имя")
    private String name;
    private String email;

    @NotBlank(message = "Заполните фамилию")
    private String surname;

    @NotBlank(message = "Введите номер телефона")
    @Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "Некорректный формат номера телефона")
    private String phoneNumber;
    private MultipartFile avatar;
    private String role;
    private String avatarFileName;

}
