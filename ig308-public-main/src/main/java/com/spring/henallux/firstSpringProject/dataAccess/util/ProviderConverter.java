package com.spring.henallux.firstSpringProject.dataAccess.util;

import com.spring.henallux.firstSpringProject.dataAccess.entity.CategoryEntity;
import com.spring.henallux.firstSpringProject.dataAccess.entity.ProductEntity;
import com.spring.henallux.firstSpringProject.model.Category;
import com.spring.henallux.firstSpringProject.model.Product;
import com.spring.henallux.firstSpringProject.model.User;
import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import org.dozer.DozerBeanMapper;
import org.springframework.stereotype.Component;

@Component
public class ProviderConverter {

    private final DozerBeanMapper dozerBeanMapper;

    public ProviderConverter() {
        this.dozerBeanMapper = new DozerBeanMapper();
    }

    public UserEntity userModelToUserEntity(User user) {
        if (user == null) return null;
        return dozerBeanMapper.map(user, UserEntity.class);
    }

    public User userEntityToUserModel(UserEntity userEntity) {
        if (userEntity == null) return null;
        return dozerBeanMapper.map(userEntity, User.class);
    }

    public CategoryEntity categoryModelToCategoryEntity(Category category) {
        if (category == null) return null;
        return dozerBeanMapper.map(category, CategoryEntity.class);
    }

    public Category categoryEntityToCategoryModel(CategoryEntity categoryEntity) {
        if (categoryEntity == null) return null;
        return dozerBeanMapper.map(categoryEntity, Category.class);
    }

    public Product productEntityToProductModel(ProductEntity productEntity) {
        if (productEntity == null) return null;
        return dozerBeanMapper.map(productEntity, Product.class);
    }
}
