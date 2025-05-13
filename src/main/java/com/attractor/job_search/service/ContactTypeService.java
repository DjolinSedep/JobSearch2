package com.attractor.job_search.service;

import com.attractor.job_search.dto.ContactTypeDto;
import com.attractor.job_search.model.ContactType;

public interface ContactTypeService {
    ContactType getContactTypeById(Long contactTypeId);

    ContactTypeDto convertToContactTypeDto(ContactType contactType);
}
