package com.attractor.job_search.service;

import com.attractor.job_search.dto.WorkExperienceInfoDto;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.model.WorkExperienceInfo;


import java.util.List;

public interface WorkExperienceInfoService {

    void createWorkExperiences(List<WorkExperienceInfoDto> dtoList, Resume resume);

    void updateOrCreateWorkExperiences(List<WorkExperienceInfoDto> dtoList, Resume resume);

    void validateWorkExperience(List<WorkExperienceInfoDto> workExperienceInfoList, Integer userAge);

    List<WorkExperienceInfoDto> convertToWorkExperienceInfoList(List<WorkExperienceInfo> workExperienceInfoList);

    WorkExperienceInfoDto convertToWorkExperienceInfoDto(WorkExperienceInfo workExperienceInfo);
}
