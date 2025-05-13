package com.attractor.job_search.model;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "education_info")
public class EducationInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "resume_id")
    private Resume resume;
    private String institution;
    private String program;
    private Date startDate;
    private Date endDate;
    private String degree;
}
