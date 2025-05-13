package com.attractor.job_search.model;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "resumes")
public class Resume {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "applicant_id")
    private User user;
    private String name;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    private Integer salary;
    private Boolean isActive;
    private LocalDateTime createdDate;
    private LocalDateTime updateTime;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "resume")
    private List<WorkExperienceInfo> workExperienceInfoList;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "resume")
    private List<EducationInfo> educationInfoList;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "resume")
    private List<ContactInfo> contactInfoList;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "resume")
    private List<RespondedApplicant> respondedApplicants;
}
