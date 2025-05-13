package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.ContactTypeDto;
import com.attractor.job_search.model.ContactType;
import com.attractor.job_search.repository.ContactTypeRepository;
import com.attractor.job_search.service.ContactTypeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContactTypeServiceImpl implements ContactTypeService {
    private final ContactTypeRepository contactTypeRepository;

    @Override
    public ContactType getContactTypeById(Long contactTypeId){
        return contactTypeRepository.findById(contactTypeId).orElseThrow(()->new NoSuchElementException("Contact Type Not Found"));
    }

    @Override
    public ContactTypeDto convertToContactTypeDto(ContactType contactType){
        return ContactTypeDto.builder()
                .id(contactType.getId())
                .type(contactType.getType())
                .build();
    }
}
