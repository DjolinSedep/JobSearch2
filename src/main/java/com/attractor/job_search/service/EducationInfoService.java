package com.attractor.job_search.service;

import com.attractor.job_search.dto.EducationInfoDto;
import com.attractor.job_search.model.EducationInfo;
import com.attractor.job_search.model.Resume;

import java.util.List;

public interface EducationInfoService {

    void createEducations(List<EducationInfoDto> dtoList, Resume resume);

    void updateOrCreateEducations(List<EducationInfoDto> dtoList, Resume resume);

    void validateEducationDates(List<EducationInfoDto> educationInfoList, Integer userAge);

    List<EducationInfoDto> convertToEducationInfoDtoList(List<EducationInfo> educationInfoList);

    EducationInfoDto convertToEducationInfoDto(EducationInfo educationInfo);
}
