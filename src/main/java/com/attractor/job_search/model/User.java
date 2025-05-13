package com.attractor.job_search.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String surname;
    private Integer age;
    private String email;
    private String password;
    private String phoneNumber;
    private String avatar;
    private boolean enabled;
    private String resetPasswordToken;
    private String interfaceLanguage;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<Vacancy> vacancies;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<Resume> resumes;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

}
