package com.attractor.job_search.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Category parentCategory;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "parentCategory")
    private List<Category> childrenCategories;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
    private List<Vacancy> vacancies;

}
