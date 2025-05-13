package com.attractor.job_search.service;

public interface RespondedApplicantService {
    void applyToVacancy(Long resumeId, Long vacancyId);

    Long getResponsesByResume(Long userId);

    Long getResponsesByVacancy(Long userId);
}
