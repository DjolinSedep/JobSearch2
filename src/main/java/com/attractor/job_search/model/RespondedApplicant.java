package com.attractor.job_search.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "responded_applicants")
public class RespondedApplicant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "resume_id")
    private Resume resume;
    @ManyToOne
    @JoinColumn(name = "vacancy_id")
    private Vacancy vacancy;
    private Boolean confirmation;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "respondedApplicant")
    private List<Message> messages;

}
