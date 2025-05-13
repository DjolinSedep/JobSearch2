package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.ContactInfoDto;
import com.attractor.job_search.model.ContactInfo;
import com.attractor.job_search.model.ContactType;
import com.attractor.job_search.model.Resume;
import com.attractor.job_search.repository.ContactInfoRepository;
import com.attractor.job_search.service.ContactInfoService;
import com.attractor.job_search.service.ContactTypeService;
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
public class ContactInfoServiceImpl implements ContactInfoService {
    private final ContactInfoRepository contactInfoRepository;
    private final ContactTypeService contactTypeService;

    @Override
    public void createContacts(List<ContactInfoDto> dtoList, Resume resume) {
        if (dtoList == null || dtoList.isEmpty()) {
            return;
        }

        for (ContactInfoDto dto : dtoList) {
            if (!hasContactData(dto)) {
                continue;
            }
            ContactType contactType = contactTypeService.getContactTypeById(dto.getContactType().getId());
            ContactInfo contactInfo = new ContactInfo();
            contactInfo.setResume(resume);
            contactInfo.setContactType(contactType);
            contactInfo.setContactValue(dto.getValue());

            contactInfoRepository.save(contactInfo);
        }
    }

    @Override
    public void updateOrCreateContacts(List<ContactInfoDto> dtoList, Resume resume) {
        if (dtoList == null || dtoList.isEmpty()) {
            return;
        }

        List<ContactInfo> existingRecords = contactInfoRepository.findByResumeId(resume.getId());
        Map<Long, ContactInfo> existingRecordsMap = existingRecords.stream()
                .collect(Collectors.toMap(ContactInfo::getId, Function.identity(), (a, b) -> a));

        for (ContactInfoDto dto : dtoList) {
            if (!hasContactData(dto)) {
                continue;
            }
            ContactInfo contactInfo;

            if (dto.getId() != null && existingRecordsMap.containsKey(dto.getId())) {
                contactInfo = existingRecordsMap.get(dto.getId());
            } else {
                contactInfo = new ContactInfo();
                contactInfo.setResume(resume);
            }
            if(dto.getContactType().getId() == null){
                ContactType contactType = contactTypeService.getContactTypeById(dto.getContactType().getId());
                contactInfo.setContactType(contactType);
            }

            contactInfo.setContactValue(dto.getValue());

            contactInfoRepository.save(contactInfo);
        }
    }

    private boolean hasContactData(ContactInfoDto dto) {
        return dto != null &&
                dto.getContactType() != null &&
                dto.getContactType().getId() != null &&
                dto.getValue() != null && !dto.getValue().trim().isEmpty();
    }

    @Override
    public List<ContactInfoDto> convertToContactInfoDtoList(List<ContactInfo> contactInfoList) {
        return contactInfoList.stream().map(this::convertToContactInfoDto).toList();
    }

    @Override
    public ContactInfoDto convertToContactInfoDto(ContactInfo contactInfo) {
        return ContactInfoDto.builder()
                .id(contactInfo.getId())
                .contactType(contactTypeService.convertToContactTypeDto(contactInfo.getContactType()))
                .value(contactInfo.getContactValue())
                .build();
    }

}
