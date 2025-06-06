package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.EducationInfoDto;
import com.attractor.job_search.model.EducationInfo;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.repository.EducationInfoRepository;
import com.attractor.job_search.service.EducationInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;


@Slf4j
@Service
@RequiredArgsConstructor
public class EducationInfoServiceImpl implements EducationInfoService {
    private final EducationInfoRepository educationInfoRepository;
    private final MessageSource messageSource;


    @Override
    public void createEducations(List<EducationInfoDto> dtoList, Resume resume) {
        if (dtoList == null || dtoList.isEmpty()) {
            return;
        }

        for (EducationInfoDto dto : dtoList) {
            if (!hasEducationData(dto)) {
                continue;
            }

            EducationInfo educationInfo = new EducationInfo();
            educationInfo.setResume(resume);
            updateEducationFields(educationInfo, dto);

            educationInfoRepository.save(educationInfo);
        }
    }

    @Override
    public void updateOrCreateEducations(List<EducationInfoDto> dtoList, Resume resume) {
        List<EducationInfo> existingRecords = educationInfoRepository.findByResumeId(resume.getId());
        if (dtoList == null || dtoList.isEmpty()) {
            educationInfoRepository.deleteAll(existingRecords);
            return;
        }
        Set<Long> dtoIds = dtoList.stream()
                .map(EducationInfoDto::getId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        existingRecords.stream()
                .filter(record -> !dtoIds.contains(record.getId()))
                .forEach(educationInfoRepository::delete);

        Map<Long, EducationInfo> existingRecordsMap = existingRecords.stream()
                .collect(Collectors.toMap(EducationInfo::getId, Function.identity(), (a, b) -> a));
        for (EducationInfoDto dto : dtoList) {
            if (!hasEducationData(dto)) {
                continue;
            }
            EducationInfo educationInfo;

            if (dto.getId() != null && existingRecordsMap.containsKey(dto.getId())) {
                educationInfo = existingRecordsMap.get(dto.getId());
            } else {

                educationInfo = new EducationInfo();
                educationInfo.setResume(resume);
            }

            updateEducationFields(educationInfo, dto);
            educationInfoRepository.save(educationInfo);
        }
    }

    private void updateEducationFields(EducationInfo entity, EducationInfoDto dto) {
        entity.setInstitution(dto.getInstitution());
        entity.setProgram(dto.getProgram());
        entity.setDegree(dto.getDegree());

        if (dto.getStartDate() != null) {
            entity.setStartDate(new java.sql.Date(dto.getStartDate().getTime()));
        } else {
            entity.setStartDate(null);
        }

        if (dto.getEndDate() != null) {
            entity.setEndDate(new java.sql.Date(dto.getEndDate().getTime()));
        } else {
            entity.setEndDate(null);
        }
    }

    private boolean hasEducationData(EducationInfoDto dto) {
        return dto != null && (
                (dto.getInstitution() != null && !dto.getInstitution().trim().isEmpty()) ||
                        (dto.getProgram() != null && !dto.getProgram().trim().isEmpty()) ||
                        (dto.getDegree() != null && !dto.getDegree().trim().isEmpty()) ||
                        dto.getStartDate() != null ||
                        dto.getEndDate() != null
        );
    }


    @Override
    public void validateEducationDates(List<EducationInfoDto> educationInfoList, Integer userAge, Locale locale) {
        if (educationInfoList == null || educationInfoList.isEmpty()) {
            return;
        }

        for (EducationInfoDto educationInfo : educationInfoList) {
            validateSingleEducationDates(educationInfo, userAge, locale);
        }
    }


    private void validateSingleEducationDates(EducationInfoDto educationInfo, Integer userAge, Locale locale) {
        if (educationInfo == null || educationInfo.getStartDate() == null || educationInfo.getEndDate() == null) {
            return;
        }

        LocalDate currentDate = LocalDate.now();

        LocalDate startDate = educationInfo.getStartDate().toInstant()
                .atZone(ZoneId.systemDefault()).toLocalDate();

        LocalDate endDate = educationInfo.getEndDate().toInstant()
                .atZone(ZoneId.systemDefault()).toLocalDate();

        if (startDate.isAfter(endDate)) {
            throw new IllegalArgumentException(
                    messageSource.getMessage("education.startDate.afterEndDate", null, locale));
        }

        LocalDate earliestPossibleEducationDate = currentDate.minusYears(userAge).plusYears(6);

        if (startDate.isBefore(earliestPossibleEducationDate)) {
            throw new IllegalArgumentException(
                    messageSource.getMessage("education.startDate.tooEarly", null, locale));
        }

        if (endDate.isAfter(currentDate)) {
            throw new IllegalArgumentException(
                    messageSource.getMessage("education.endDate.future", null, locale));
        }
    }

    @Override
    public List<EducationInfoDto> convertToEducationInfoDtoList(List<EducationInfo> educationInfoList) {
        return educationInfoList.stream().map(this::convertToEducationInfoDto).toList();
    }


    @Override
    public EducationInfoDto convertToEducationInfoDto(EducationInfo educationInfo){
        return EducationInfoDto.builder()
                .id(educationInfo.getId())
                .institution(educationInfo.getInstitution())
                .program(educationInfo.getProgram())
                .degree(educationInfo.getDegree())
                .startDate(educationInfo.getStartDate())
                .endDate(educationInfo.getEndDate())
                .build();
    }
}
