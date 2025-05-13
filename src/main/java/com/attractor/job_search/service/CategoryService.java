package com.attractor.job_search.service;

import com.attractor.job_search.dto.CategoryDto;
import com.attractor.job_search.model.Category;

import java.util.List;

public interface CategoryService {
    List<CategoryDto> getAllCategories();

    Category getCategoryById(Long categoryId);

    CategoryDto convertToDto(Category category);
}
