package com.attractor.job_search.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "roles")
public class Role {
    @Id
    private Long id;

    @Column(name = "role")
    private String roleName;

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "roles")
    private Collection<Authority> authorities;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
    private List<User> users;
}
