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
@Table(name = "vacancies")
public class Vacancy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    private Integer salary;
    private Integer expFrom;
    private Integer expTo;
    private Boolean isActive;
    @ManyToOne
    @JoinColumn(name = "author_id")
    private User user;
    private LocalDateTime createdDate;
    private LocalDateTime updateTime;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "vacancy")
    private List<RespondedApplicant> respondedApplicants;

}
