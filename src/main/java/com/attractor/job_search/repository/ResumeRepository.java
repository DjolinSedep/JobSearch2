package com.attractor.job_search.repository;


import com.attractor.job_search.model.Resume;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResumeRepository extends JpaRepository<Resume, Long> {
    Page<Resume> findByIsActiveTrue(Pageable pageable);
    Page<Resume> findResumesByUserId(Long userId, Pageable pageable);

}
