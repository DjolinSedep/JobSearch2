package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.WorkExperienceInfoDto;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.model.WorkExperienceInfo;
import com.attractor.job_search.repository.WorkExperienceInfoRepository;
import com.attractor.job_search.service.WorkExperienceInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;


@Slf4j
@Service
@RequiredArgsConstructor
public class WorkExperienceInfoServiceImpl implements WorkExperienceInfoService {
    private final WorkExperienceInfoRepository workExperienceInfoRepository;


    @Override
    public void createWorkExperiences(List<WorkExperienceInfoDto> dtoList, Resume resume) {
        if (dtoList == null || dtoList.isEmpty()) {
            return;
        }

        for (WorkExperienceInfoDto dto : dtoList) {
            if (!hasWorkExperienceData(dto)) {
                continue;
            }

            WorkExperienceInfo workExperienceInfo = new WorkExperienceInfo();
            workExperienceInfo.setResume(resume);
            updateWorkExperienceFields(workExperienceInfo, dto);

            workExperienceInfoRepository.save(workExperienceInfo);
        }
    }

    @Override
    public void updateOrCreateWorkExperiences(List<WorkExperienceInfoDto> dtoList, Resume resume) {
        if (dtoList == null || dtoList.isEmpty()) {
            return;
        }
        List<WorkExperienceInfo> existingRecords = workExperienceInfoRepository.findByResumeId(resume.getId());
        Map<Long, WorkExperienceInfo> existingRecordsMap = existingRecords.stream()
                .collect(Collectors.toMap(WorkExperienceInfo::getId, Function.identity(), (a, b) -> a));

        for (WorkExperienceInfoDto dto : dtoList) {
            if (!hasWorkExperienceData(dto)) {
                continue;
            }
            WorkExperienceInfo workExperienceInfo;

            if (dto.getId() != null && existingRecordsMap.containsKey(dto.getId())) {
                workExperienceInfo = existingRecordsMap.get(dto.getId());
            } else {
                workExperienceInfo = new WorkExperienceInfo();
                workExperienceInfo.setResume(resume);
            }
            updateWorkExperienceFields(workExperienceInfo, dto);
            workExperienceInfoRepository.save(workExperienceInfo);
        }
    }

    private void updateWorkExperienceFields(WorkExperienceInfo entity, WorkExperienceInfoDto dto) {
        entity.setYears(dto.getYears());
        entity.setPosition(dto.getPosition());
        entity.setCompanyName(dto.getCompanyName());
        entity.setResponsibilities(dto.getResponsibilities());
    }

    private boolean hasWorkExperienceData(WorkExperienceInfoDto dto) {
        return dto != null && (
                dto.getYears() != null ||
                        (dto.getPosition() != null && !dto.getPosition().trim().isEmpty()) ||
                        (dto.getCompanyName() != null && !dto.getCompanyName().trim().isEmpty()) ||
                        (dto.getResponsibilities() != null && !dto.getResponsibilities().trim().isEmpty())
        );
    }



    @Override
    public void validateWorkExperience(List<WorkExperienceInfoDto> workExperienceInfoList, Integer userAge) {
        if (workExperienceInfoList == null || workExperienceInfoList.isEmpty()) {
            return;
        }

        for (WorkExperienceInfoDto workExperienceInfo : workExperienceInfoList) {
            validateSingleWorkExperience(workExperienceInfo, userAge);
        }

        int totalExperience = workExperienceInfoList.stream()
                .filter(dto -> dto != null && dto.getYears() != null)
                .mapToInt(WorkExperienceInfoDto::getYears)
                .sum();

        int maxPossibleYears = userAge - 16;

        if (totalExperience > maxPossibleYears) {
            throw new IllegalArgumentException(
                    String.format("Общий стаж работы (%d) не может превышать возможное количество лет в зависимости от возраста (%d)",
                            totalExperience, maxPossibleYears));
        }
    }


    private void validateSingleWorkExperience(WorkExperienceInfoDto workExperienceInfo, Integer userAge) {
        if (workExperienceInfo == null || workExperienceInfo.getYears() == null) {
            return;
        }

        int maxPossibleYears = userAge - 16;

        if (workExperienceInfo.getYears() > maxPossibleYears) {
            throw new IllegalArgumentException(
                    String.format("Количество лет опыта работы (%d) не может превышать возможное количество лет в зависимости от возраста (%d)",
                            workExperienceInfo.getYears(), maxPossibleYears));
        }

        if (workExperienceInfo.getYears() < 0) {
            throw new IllegalArgumentException("Колество лет опыта работы не может быть отрицательным");
        }
    }

    @Override
    public List<WorkExperienceInfoDto> convertToWorkExperienceInfoList(List<WorkExperienceInfo> workExperienceInfoList){
        return workExperienceInfoList.stream().map(this::convertToWorkExperienceInfoDto).toList();
    }

    @Override
    public WorkExperienceInfoDto convertToWorkExperienceInfoDto(WorkExperienceInfo workExperienceInfo) {
        return WorkExperienceInfoDto.builder()
                .id(workExperienceInfo.getId())
                .years(workExperienceInfo.getYears())
                .position(workExperienceInfo.getPosition())
                .companyName(workExperienceInfo.getCompanyName())
                .responsibilities(workExperienceInfo.getResponsibilities())
                .build();
    }
}
