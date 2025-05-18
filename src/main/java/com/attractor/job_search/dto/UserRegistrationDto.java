package com.attractor.job_search.dto;



import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRegistrationDto {

    @NotBlank(message = "{validation.user.name.blank}")
    private String name;

    @NotBlank(message = "{validation.user.surname.blank}")
    private String surname;

    @NotNull(message = "{validation.user.age.null}")
    @Min(value = 18, message = "{validation.user.age.min}")
    private Integer age;

    @NotBlank(message = "{validation.user.email.blank}")
    @Email(message = "{validation.user.email.invalid}")
    private String email;

    @NotBlank(message = "{validation.user.password.blank}")
    @Size(min = 6, message = "{validation.user.password.size}")
    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).+$",
            message = "{validation.user.password.pattern}")
    private String password;

    @NotBlank(message = "{validation.user.phoneNumber.blank}")
    @Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "{validation.user.phoneNumber.pattern}")
    private String phoneNumber;

    @NotBlank(message = "{validation.user.accountType.blank}")
    private String accountType;
}