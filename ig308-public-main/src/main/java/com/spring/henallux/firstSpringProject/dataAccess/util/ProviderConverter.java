package com.spring.henallux.firstSpringProject.dataAccess.util;

import com.spring.henallux.firstSpringProject.dataAccess.entity.CategoryEntity;
import com.spring.henallux.firstSpringProject.dataAccess.entity.ProductEntity;
import com.spring.henallux.firstSpringProject.model.Category;
import com.spring.henallux.firstSpringProject.model.Product;
import com.spring.henallux.firstSpringProject.model.User;
import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.stereotype.Component;

@Component
public class ProviderConverter {

    private Mapper mapper;
    public ProviderConverter() {
        mapper = new DozerBeanMapper();
    }

    public UserEntity userModelToUserEntity(User user) {
        if (user == null) return null;
        return mapper.map(user, UserEntity.class);
    }

    public User userEntityToUserModel(UserEntity userEntity) {
        if (userEntity == null) return null;

        User user = mapper.map(userEntity, User.class);

        user.setAccountNonExpired(userEntity.isAccountNonExpired());
        user.setAccountNonLocked(userEntity.isAccountNonLocked());
        user.setCredentialsNonExpired(userEntity.isCredentialsNonExpired());
        user.setEnabled(userEntity.isEnabled());
        user.setAuthorities(userEntity.getAuthorities());

        return user;
    }

    public CategoryEntity categoryModelToCategoryEntity(Category category) {
        if (category == null) return null;
        return mapper.map(category, CategoryEntity.class);
    }

    public Category categoryEntityToCategoryModel(CategoryEntity categoryEntity) {
        if (categoryEntity == null) return null;
        return mapper.map(categoryEntity, Category.class);
    }

    public Product productEntityToProductModel(ProductEntity productEntity) {
        if (productEntity == null) return null;
        return mapper.map(productEntity, Product.class);
    }
}
