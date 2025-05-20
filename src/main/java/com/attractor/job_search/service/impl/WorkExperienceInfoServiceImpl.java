package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.WorkExperienceInfoDto;
import com.attractor.job_search.model.Message;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.model.WorkExperienceInfo;
import com.attractor.job_search.repository.WorkExperienceInfoRepository;
import com.attractor.job_search.service.WorkExperienceInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;


@Slf4j
@Service
@RequiredArgsConstructor
public class WorkExperienceInfoServiceImpl implements WorkExperienceInfoService {
    private final WorkExperienceInfoRepository workExperienceInfoRepository;
    private final MessageSource messageSource;


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
        List<WorkExperienceInfo> existingRecords = workExperienceInfoRepository.findByResumeId(resume.getId());
        if (dtoList == null || dtoList.isEmpty()) {
            workExperienceInfoRepository.deleteAll(existingRecords);
            return;
        }

        Set<Long> dtoIds = dtoList.stream()
                .map(WorkExperienceInfoDto::getId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        existingRecords.stream()
                .filter(record -> !dtoIds.contains(record.getId()))
                .forEach(workExperienceInfoRepository::delete);

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
    public void validateWorkExperience(List<WorkExperienceInfoDto> workExperienceInfoList, Integer userAge, Locale locale) {
        if (workExperienceInfoList == null || workExperienceInfoList.isEmpty()) {
            return;
        }

        for (WorkExperienceInfoDto workExperienceInfo : workExperienceInfoList) {
            validateSingleWorkExperience(workExperienceInfo, userAge, locale);
        }

        int totalExperience = workExperienceInfoList.stream()
                .filter(dto -> dto != null && dto.getYears() != null)
                .mapToInt(WorkExperienceInfoDto::getYears)
                .sum();

        int maxPossibleYears = userAge - 16;

        if (totalExperience > maxPossibleYears) {
            throw new IllegalArgumentException(
                    messageSource.getMessage("workExperience.total.exceedsMaximum",
                            new Object[]{totalExperience, maxPossibleYears},
                            locale));
        }
    }


    private void validateSingleWorkExperience(WorkExperienceInfoDto workExperienceInfo, Integer userAge, Locale locale) {
        if (workExperienceInfo == null || workExperienceInfo.getYears() == null) {
            return;
        }

        int maxPossibleYears = userAge - 16;

        if (workExperienceInfo.getYears() > maxPossibleYears) {
            throw new IllegalArgumentException(
                    messageSource.getMessage("workExperience.years.exceedsMaximum",
                            new Object[]{workExperienceInfo.getYears(), maxPossibleYears},
                            locale));
        }

        if (workExperienceInfo.getYears() < 0) {
            throw new IllegalArgumentException(
                    messageSource.getMessage("workExperience.years.negative", null, locale));
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
