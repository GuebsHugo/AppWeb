package com.spring.henallux.firstSpringProject.dataAccess.util;

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
}
