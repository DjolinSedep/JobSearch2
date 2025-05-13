package com.attractor.job_search.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ContactInfoDto {
    private Long id;
    private ContactTypeDto contactType;
    private String value;
}
