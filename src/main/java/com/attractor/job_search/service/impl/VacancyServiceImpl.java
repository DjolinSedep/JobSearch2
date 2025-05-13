package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.VacancyDto;
import com.attractor.job_search.model.Category;
import com.attractor.job_search.model.User;
import com.attractor.job_search.model.Vacancy;
import com.attractor.job_search.repository.VacancyRepository;
import com.attractor.job_search.service.CategoryService;
import com.attractor.job_search.service.ResumeService;
import com.attractor.job_search.service.UserService;
import com.attractor.job_search.service.VacancyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class VacancyServiceImpl implements VacancyService {
    private final VacancyRepository vacancyRepository;
    private final CategoryService categoryService;
    private final UserService userService;
    private final ResumeService resumeService;


    @Override
    public Page<VacancyDto> getFilteredVacancies(Long categoryId, String sortField,
                                                 String searchTerm, Pageable pageable) {

        Page<Vacancy> vacancies;

        if ("salary".equals(sortField)) {
            vacancies = categoryId != null
                    ? vacancyRepository.findByIsActiveTrueAndCategoryIdOrderBySalaryDesc(categoryId, pageable)
                    : vacancyRepository.findByIsActiveTrueOrderBySalaryDesc(pageable);
        }
        else if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            vacancies = categoryId != null
                    ? vacancyRepository.findByIsActiveTrueAndNameContainingIgnoreCaseAndCategoryId(
                    searchTerm, categoryId, pageable)
                    : vacancyRepository.findByIsActiveTrueAndNameContainingIgnoreCase(searchTerm, pageable);
        }
        else {
            if (sortField == null || "null".equals(sortField)) {
                sortField = "updateTime";
            }

            Sort sort = Sort.by(Sort.Direction.DESC, sortField);
            pageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), sort);

            vacancies = categoryId != null
                    ? vacancyRepository.findByIsActiveTrueAndCategoryId(categoryId, pageable)
                    : vacancyRepository.findByIsActiveTrue(pageable);
        }

        var list = convertToListVacancyDto(vacancies.getContent());
        return new PageImpl<>(list, pageable, vacancies.getTotalElements());
    }

    @Override
    public VacancyDto getVacancyDtoById(Long vacancyId){
        Vacancy vacancy = vacancyRepository.findById(vacancyId).orElseThrow(()->new NoSuchElementException("Vacancy Not Found"));
        return convertToVacancyDto(vacancy);
    }

    @Override
    public Vacancy getVacancyById(Long vacancyId){
        return vacancyRepository.findById(vacancyId).orElseThrow(()->new NoSuchElementException("Vacancy Not Found"));
    }

    @Override
    public Page<VacancyDto> getVacanciesByAuthorId(Long authorId, Pageable pageable){
        Page<Vacancy> vacancies;
        boolean isSortedByResponses = false;

        for (Sort.Order order : pageable.getSort()) {
            if (order.getProperty().equals("responses")) {
                isSortedByResponses = true;
                break;
            }
        }

        if (isSortedByResponses) {
            vacancies = vacancyRepository.findVacanciesByUserIdOrderByResponsesCount(authorId, pageable);
        } else {
            vacancies = vacancyRepository.findVacanciesByUserId(authorId, pageable);
        }
        var list = convertToListVacancyDto(vacancies.getContent());
        return new PageImpl<>(list, pageable, list.size());
    }


    @Override
    public void create(VacancyDto vacancyDto){
        if (vacancyDto.getExpFrom() !=null && vacancyDto.getExpTo() !=null &&
                (Objects.equals(vacancyDto.getExpFrom(), vacancyDto.getExpTo()) || vacancyDto.getExpFrom() > vacancyDto.getExpTo() || vacancyDto.getExpTo() > 60)){
            throw new IllegalArgumentException("Некорректно введено значение опыта работы");
        }

        Category category = categoryService.getCategoryById(vacancyDto.getCategory().getId());
        User user = userService.getAuthenticatedUser();
        Vacancy vacancy = new Vacancy();
        vacancy.setName(vacancyDto.getName());
        vacancy.setExpFrom(vacancyDto.getExpFrom());
        vacancy.setExpTo(vacancyDto.getExpTo());
        vacancy.setDescription(vacancyDto.getDescription());
        vacancy.setUpdateTime(LocalDateTime.now());
        vacancy.setCreatedDate(LocalDateTime.now());
        vacancy.setIsActive(vacancyDto.getIsActive());
        vacancy.setUser(user);
        vacancy.setSalary(Integer.parseInt(vacancyDto.getSalary()));
        vacancy.setCategory(category);
        vacancyRepository.save(vacancy);
    }



    @Override
    public void edit(VacancyDto vacancyDto){
        if (vacancyDto.getExpFrom() !=null && vacancyDto.getExpTo() !=null &&
                (Objects.equals(vacancyDto.getExpFrom(), vacancyDto.getExpTo()) || vacancyDto.getExpFrom() > vacancyDto.getExpTo() || vacancyDto.getExpTo() > 60)){
            throw new IllegalArgumentException("Некорректно введено значение опыта работы");
        }
        Vacancy vacancy = vacancyRepository.findById(vacancyDto.getId())
                .orElseThrow(() -> new NoSuchElementException("Vacancy not found") );
        Category category = categoryService.getCategoryById(vacancyDto.getCategory().getId());
        vacancy.setName(vacancyDto.getName());
        vacancy.setDescription(vacancyDto.getDescription());
        vacancy.setSalary(Integer.parseInt(vacancyDto.getSalary()));
        vacancy.setExpFrom(vacancyDto.getExpFrom());
        vacancy.setExpTo(vacancyDto.getExpTo());
        vacancy.setIsActive(vacancyDto.getIsActive() != null);
        vacancy.setUpdateTime(LocalDateTime.now());
        vacancy.setCategory(category);

        vacancyRepository.save(vacancy);
    }

    @Override
    public void updateVacancyTime(Long vacancyId){
        Vacancy vacancy = getVacancyById(vacancyId);
        vacancy.setUpdateTime(LocalDateTime.now());
        vacancyRepository.save(vacancy);
    }

    @Override
    public List<VacancyDto> convertToListVacancyDto(List<Vacancy> vacancies){
        return vacancies.stream().map(this::convertToVacancyDto).toList();
    }

    @Override
    public VacancyDto convertToVacancyDto(Vacancy vacancy){
        return VacancyDto.builder()
                .id(vacancy.getId())
                .expTo(vacancy.getExpTo())
                .name(vacancy.getName())
                .description(vacancy.getDescription())
                .isActive(vacancy.getIsActive())
                .salary(vacancy.getSalary().toString())
                .expFrom(vacancy.getExpFrom())
                .updateTime(vacancy.getUpdateTime())
                .authorName(vacancy.getUser().getName() + " " + vacancy.getUser().getSurname())
                .authorEmail(vacancy.getUser().getEmail())
                .category(categoryService.convertToDto(vacancy.getCategory()))
                .build();
    }
}
