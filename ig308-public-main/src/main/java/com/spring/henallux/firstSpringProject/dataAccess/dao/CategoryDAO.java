package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.dataAccess.entity.CategoryEntity;
import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import com.spring.henallux.firstSpringProject.dataAccess.repository.CategoryRepository;
import com.spring.henallux.firstSpringProject.dataAccess.repository.UserRepository;
import com.spring.henallux.firstSpringProject.dataAccess.util.ProviderConverter;
import com.spring.henallux.firstSpringProject.model.Category;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CategoryDAO implements CategoryDataAccess{

    private CategoryRepository categoryRepository;
    private ProviderConverter providerConverter;

    public CategoryDAO(CategoryRepository categoryRepository, ProviderConverter providerConverter) {
        this.categoryRepository = categoryRepository;
        this.providerConverter = providerConverter;
    }

    @Override
    public ArrayList<Category> getAllCategories() {
        List<CategoryEntity> CategoryEntites = categoryRepository.findAll();

        ArrayList<Category> categories = new ArrayList<>();

        for (CategoryEntity category : CategoryEntites) {
            categories.add(providerConverter.categoryEntityToCategoryModel(category));
        }

        return categories;
    }
}
