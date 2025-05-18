package com.attractor.job_search.dto;


import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDto {
    @NotNull(message = "{validation.category.id.null}")
    private Long id;
    private String name;
}
