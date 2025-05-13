package com.attractor.job_search.repository;


import com.attractor.job_search.model.ContactInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ContactInfoRepository extends JpaRepository<ContactInfo, Long> {
    ContactInfo findContactInfoByResumeId(Long resumeId);
    List<ContactInfo> findByResumeId(Long resumeId);

}
