package com.attractor.job_search.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VacancyDto {
    private Long id;

    @NotBlank(message = "{validation.vacancy.name.blank}")
    private String name;

    @NotBlank(message = "{validation.vacancy.description.blank}")
    private String description;

    @Valid
    private CategoryDto category;

    @NotBlank(message = "{validation.vacancy.salary.blank}")
    @Pattern(regexp = "^[1-9]\\d*$", message = "{validation.vacancy.salary.pattern}")
    private String salary;

    @Min(value = 0, message = "{validation.vacancy.expFrom.min}")
    private Integer expFrom;

    @Min(value = 0, message = "{validation.vacancy.expTo.min}")
    private Integer expTo;

    private Boolean isActive;
    private String authorName;
    private String authorEmail;
    private LocalDateTime updateTime;
    private Integer responses;
}