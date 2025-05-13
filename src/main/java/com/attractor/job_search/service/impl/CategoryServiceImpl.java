package com.attractor.job_search.service.impl;

import com.attractor.job_search.dto.CategoryDto;
import com.attractor.job_search.model.Category;
import com.attractor.job_search.repository.CategoryRepository;
import com.attractor.job_search.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public List<CategoryDto> getAllCategories(){
        var list = categoryRepository.findAll();
        return list.stream()
                .map(this::convertToDto)
                .toList();

    }

    @Override
    public Category getCategoryById(Long categoryId){
        return categoryRepository.findById(categoryId).orElseThrow(()-> new NoSuchElementException("Category not found"));
    }

    @Override
    public CategoryDto convertToDto(Category category){
        return CategoryDto.builder()
                .id(category.getId())
                .name(category.getName())
                .build();
    }
}