package com.attractor.job_search.service;

import com.attractor.job_search.dto.ContactInfoDto;
import com.attractor.job_search.model.ContactInfo;
import com.attractor.job_search.model.Resume;

import java.util.List;

public interface ContactInfoService {

    void createContacts(List<ContactInfoDto> dtoList, Resume resume);

    void updateOrCreateContacts(List<ContactInfoDto> dtoList, Resume resume);

    List<ContactInfoDto> convertToContactInfoDtoList(List<ContactInfo> contactInfoList);

    ContactInfoDto convertToContactInfoDto(ContactInfo contactInfo);
}
