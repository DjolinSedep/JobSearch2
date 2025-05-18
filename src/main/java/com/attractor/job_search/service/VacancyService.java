package com.attractor.job_search.service;

import com.attractor.job_search.dto.VacancyDto;
import com.attractor.job_search.model.Vacancy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Locale;

public interface VacancyService {

    Page<VacancyDto> getFilteredVacancies(Long categoryId, String sortField,
                                          String searchTerm, Pageable pageable);

    VacancyDto getVacancyDtoById(Long vacancyId);

    Vacancy getVacancyById(Long vacancyId);

    Page<VacancyDto> getVacanciesByAuthorId(Long authorId, Pageable pageable);

    void create(VacancyDto vacancyDto, Locale locale);

    void edit(VacancyDto vacancyDto, Locale locale);

    void updateVacancyTime(Long vacancyId);

    List<VacancyDto> convertToListVacancyDto(List<Vacancy> vacancies);

    VacancyDto convertToVacancyDto(Vacancy vacancy);
}
