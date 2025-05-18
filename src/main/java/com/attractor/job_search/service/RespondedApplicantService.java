package com.attractor.job_search.service;

import java.util.Locale;

public interface RespondedApplicantService {
    void applyToVacancy(Long resumeId, Long vacancyId, Locale locale);

    Long getResponsesByResume(Long userId);

    Long getResponsesByVacancy(Long userId);
}
