package com.attractor.job_search.dto;



import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRegistrationDto {

    @NotBlank(message = "Заполните имя")
    private String name;

    @NotBlank(message = "Заполните фамилию")
    private String surname;

    @NotNull(message = "Введите возраст")
    @Min(value = 18, message = "Возраст должен быть не менее 18 лет")
    private Integer age;

    @NotBlank(message = "Заполните email")
    @Email(message = "Некорректный формат email")
    private String email;

    @NotBlank(message = "Заполните пароль")
    @Size(min = 6, message = "Пароль должен содержать не менее 6 символов")
    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).+$",
            message = "Пароль должен содержать как минимум одну заглавную букву и одну цифру")
    private String password;

    @NotBlank(message = "Номер телефона не может быть пустым")
    @Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "Некорректный формат номера телефона")
    private String phoneNumber;

    @NotBlank(message = "Тип аккаунта должен быть выбран")
    private String accountType;
}