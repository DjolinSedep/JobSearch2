package com.attractor.job_search.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResumeDto {
    private Long id;
    @NotBlank(message = "Введите название")
    private String name;
    @NotBlank(message = "Укажите зарплату")
    @Pattern(regexp = "^[1-9]\\d*$", message = "Поле должно содержать только цифры и только положительные")
    private String salary;
    @NotNull(message = "Выберите категорию")
    private Long categoryId;
    private String categoryName;
    private LocalDateTime updateTime;
    private Long userId;
    private String userName;
    private String userEmail;
    private Boolean isActive;
    private List<WorkExperienceInfoDto> workExperienceInfoList;
    private List<EducationInfoDto> educationInfoList;
    private List<ContactInfoDto> contactInfoList;
}