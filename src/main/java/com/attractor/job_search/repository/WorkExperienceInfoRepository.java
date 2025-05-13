package com.attractor.job_search.repository;


import com.attractor.job_search.model.WorkExperienceInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WorkExperienceInfoRepository extends JpaRepository<WorkExperienceInfo, Long> {
    List<WorkExperienceInfo> findWorkExperienceInfoByResumeId(Long resumeId);
    List<WorkExperienceInfo> findByResumeId(Long resumeId);

}
