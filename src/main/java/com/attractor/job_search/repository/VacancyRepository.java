package com.attractor.job_search.repository;


import com.attractor.job_search.model.Vacancy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface VacancyRepository extends JpaRepository<Vacancy, Long> {
    Page<Vacancy> findVacanciesByUserId(Long userId, Pageable pageable);
    Page<Vacancy> findByIsActiveTrueAndCategoryIdOrderBySalaryDesc(Long categoryId, Pageable pageable);
    Page<Vacancy> findByIsActiveTrueOrderBySalaryDesc(Pageable pageable);
    Page<Vacancy> findByIsActiveTrueAndNameContainingIgnoreCaseAndCategoryId(String name, Long categoryId, Pageable pageable);
    Page<Vacancy> findByIsActiveTrueAndNameContainingIgnoreCase(String name, Pageable pageable);
    Page<Vacancy> findByIsActiveTrueAndCategoryId(Long categoryId, Pageable pageable);
    Page<Vacancy> findByIsActiveTrue(Pageable pageable);
    @Query(value = "SELECT v.* FROM vacancies v " +
            "LEFT JOIN (SELECT vacancy_id, COUNT(*) as response_count FROM responded_applicants GROUP BY vacancy_id) rc " +
            "ON v.id = rc.vacancy_id " +
            "WHERE v.author_id = :userId " +
            "ORDER BY rc.response_count DESC NULLS LAST",
            countQuery = "SELECT COUNT(*) FROM vacancies v WHERE v.author_id = :userId",
            nativeQuery = true)
    Page<Vacancy> findVacanciesByUserIdOrderByResponsesCount(Long userId, Pageable pageable);
}
