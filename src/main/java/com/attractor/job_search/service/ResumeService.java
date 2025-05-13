package com.attractor.job_search.service;

import com.attractor.job_search.dto.ResumeDto;
import com.attractor.job_search.model.Resume;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ResumeService {
    Page<ResumeDto> getAllResumes(Pageable pageable);

    ResumeDto getResumeDtoById(Long resumeId);

    Resume getResumeById(Long resumeId);

    Page<ResumeDto> getResumesByApplicantId(Long applicantId, Pageable pageable);

    void create(ResumeDto resumeDto);

    void edit(ResumeDto resumeDto);

    List<ResumeDto> convertToListResumeDto(List<Resume> resumes);

    ResumeDto convertToResumeDto(Resume resume);
}
