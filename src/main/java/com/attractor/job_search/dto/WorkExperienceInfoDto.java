package com.attractor.job_search.dto;


import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WorkExperienceInfoDto {
    private Long id;
    private Integer years;
    private String companyName;
    private String position;
    private String responsibilities;
}