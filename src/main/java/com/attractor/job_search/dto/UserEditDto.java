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
    @NotBlank(message = "{validation.user.name.blank}")
    private String name;
    private String email;
    @NotBlank(message = "{validation.user.surname.blank}")
    private String surname;
    @NotBlank(message = "{validation.user.phoneNumber.blank}")
    @Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "{validation.user.phoneNumber.pattern}")
    private String phoneNumber;
    private MultipartFile avatar;
    private String role;
    private String avatarFileName;
}
