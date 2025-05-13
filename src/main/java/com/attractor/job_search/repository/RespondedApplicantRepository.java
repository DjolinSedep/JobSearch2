package com.attractor.job_search.repository;


import com.attractor.job_search.model.RespondedApplicant;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.model.Vacancy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RespondedApplicantRepository extends JpaRepository<RespondedApplicant, Long> {
    boolean existsByResumeAndVacancy(Resume resume, Vacancy vacancy);
    @Query("SELECT COUNT(r) from RespondedApplicant r where r.resume.user.id = :authorId")
    long countByResume(Long authorId);
    @Query("SELECT COUNT(r) FROM RespondedApplicant r WHERE r.vacancy.user.id = :authorId")
    long countByVacancyAuthorId(Long authorId);
}
