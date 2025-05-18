package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.ResumeDto;
import com.attractor.job_search.model.Category;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.model.User;
import com.attractor.job_search.repository.ResumeRepository;
import com.attractor.job_search.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;

@Slf4j
@Service
@RequiredArgsConstructor
public class ResumeServiceImpl implements ResumeService {
    private final ResumeRepository resumeRepository;
    private final UserService userService;
    private final CategoryService categoryService;
    private final WorkExperienceInfoService workExperienceInfoService;
    private final EducationInfoService educationInfoService;
    private final ContactInfoService contactInfoService;

    @Override
    public Page<ResumeDto> getAllResumes(Pageable pageable){
        Page<Resume> resumes = resumeRepository.findByIsActiveTrue(pageable);
        var list = resumes.get()
                .map(this::convertToResumeDto)
                .toList();
        return new PageImpl<>(list, pageable, resumes.getTotalElements());
    }


    @Override
    public ResumeDto getResumeDtoById(Long resumeId){
        return convertToResumeDto(getResumeById(resumeId));
    }

    @Override
    public Resume getResumeById(Long resumeId){
        return resumeRepository.findById(resumeId).orElseThrow(() -> new NoSuchElementException("resume not found"));
    }


    @Override
    public Page<ResumeDto> getResumesByApplicantId(Long applicantId, Pageable pageable){
        Page<Resume> resumes = resumeRepository.findResumesByUserId(applicantId, pageable);
        var list = convertToListResumeDto(resumes.getContent());
        return new PageImpl<>(list, pageable, resumes.getTotalElements());
    }



    @Override
    public void create(ResumeDto resumeDto, Locale locale) {
        User user = userService.getAuthenticatedUser();
        educationInfoService.validateEducationDates(resumeDto.getEducationInfoList(), user.getAge(), locale);
        workExperienceInfoService.validateWorkExperience(resumeDto.getWorkExperienceInfoList(), user.getAge(), locale);
        Category category = categoryService.getCategoryById(resumeDto.getCategoryId());
        Resume resume = new Resume();
        resume.setName(resumeDto.getName());
        resume.setUser(user);
        resume.setCategory(category);
        resume.setSalary(Integer.parseInt(resumeDto.getSalary()));
        resume.setIsActive(resumeDto.getIsActive());
        resume.setCreatedDate(LocalDateTime.now());
        resume.setUpdateTime(LocalDateTime.now());
        resumeRepository.save(resume);

        workExperienceInfoService.createWorkExperiences(resumeDto.getWorkExperienceInfoList(), resume);
        educationInfoService.createEducations(resumeDto.getEducationInfoList(), resume);
        contactInfoService.createContacts(resumeDto.getContactInfoList(), resume);
    }


    @Override
    public void edit(ResumeDto resumeDto, Locale locale) {
        User user = userService.getAuthenticatedUser();
        Category category = categoryService.getCategoryById(resumeDto.getCategoryId());

        educationInfoService.validateEducationDates(resumeDto.getEducationInfoList(), user.getAge(), locale);
        workExperienceInfoService.validateWorkExperience(resumeDto.getWorkExperienceInfoList(), user.getAge(), locale);

        Resume resume = getResumeById(resumeDto.getId());
        resume.setName(resumeDto.getName());
        resume.setCategory(category);
        resume.setSalary(Integer.parseInt(resumeDto.getSalary()));
        resume.setIsActive(resumeDto.getIsActive());
        resume.setUpdateTime(LocalDateTime.now());

        workExperienceInfoService.updateOrCreateWorkExperiences(resumeDto.getWorkExperienceInfoList(), resume);
        educationInfoService.updateOrCreateEducations(resumeDto.getEducationInfoList(), resume);
        contactInfoService.updateOrCreateContacts(resumeDto.getContactInfoList(), resume);

        resumeRepository.save(resume);
    }


    @Override
    public List<ResumeDto> convertToListResumeDto(List<Resume> resumes){
        return resumes.stream().map(this::convertToResumeDto).toList();
    }


    @Override
    public ResumeDto convertToResumeDto(Resume resume){
        return ResumeDto.builder()
                .id(resume.getId())
                .name(resume.getName())
                .salary(resume.getSalary().toString())
                .categoryId(resume.getCategory().getId())
                .categoryName(resume.getCategory().getName())
                .updateTime(resume.getUpdateTime())
                .userId(resume.getUser().getId())
                .isActive(resume.getIsActive())
                .workExperienceInfoList(workExperienceInfoService.convertToWorkExperienceInfoList(resume.getWorkExperienceInfoList()))
                .educationInfoList(educationInfoService.convertToEducationInfoDtoList(resume.getEducationInfoList()))
                .contactInfoList(contactInfoService.convertToContactInfoDtoList(resume.getContactInfoList()))
                .userName(resume.getUser().getName() + " " + resume.getUser().getSurname())
                .userEmail(resume.getUser().getEmail())
                .build();
    }

}
