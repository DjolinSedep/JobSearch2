package com.attractor.job_search.repository;


import com.attractor.job_search.model.EducationInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EducationInfoRepository extends JpaRepository<EducationInfo, Long> {
    EducationInfo findEducationInfoByResumeId(Long resumeId);
    List<EducationInfo> findByResumeId(Long resumeId);


}
