package com.attractor.job_search.service.impl;

import com.attractor.job_search.model.RespondedApplicant;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.model.Vacancy;
import com.attractor.job_search.repository.RespondedApplicantRepository;
import com.attractor.job_search.service.RespondedApplicantService;
import com.attractor.job_search.service.ResumeService;
import com.attractor.job_search.service.UserService;
import com.attractor.job_search.service.VacancyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class RespondedApplicantServiceImpl implements RespondedApplicantService {
    private final RespondedApplicantRepository respondedApplicantRepository;
    private final VacancyService vacancyService;
    private final ResumeService resumeService;
    private final UserService userService;

    @Override
    public void applyToVacancy(Long resumeId, Long vacancyId) {
        Resume resume = resumeService.getResumeById(resumeId);
        Vacancy vacancy = vacancyService.getVacancyById(vacancyId);
        boolean alreadyResponded = respondedApplicantRepository.existsByResumeAndVacancy(resume, vacancy);
        if (alreadyResponded) {
            throw new IllegalStateException("Вы уже откликнулись на эту вакансию c этим резюме");
        }

        RespondedApplicant respondedApplicant = new RespondedApplicant();
        respondedApplicant.setVacancy(vacancy);
        respondedApplicant.setResume(resume);
        respondedApplicant.setConfirmation(false);
        respondedApplicantRepository.save(respondedApplicant);
    }

    @Override
    public Long getResponsesByResume(Long userId){
        return respondedApplicantRepository.countByResume(userId);
    }

    @Override
    public Long getResponsesByVacancy(Long userId){
        return respondedApplicantRepository.countByVacancyAuthorId(userId);
    }


}
