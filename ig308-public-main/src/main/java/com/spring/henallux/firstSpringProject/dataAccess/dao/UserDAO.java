package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import com.spring.henallux.firstSpringProject.dataAccess.repository.UserRepository;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserDAO implements UserDataAccess{


    private UserRepository userRepository;

    public UserDAO(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public ArrayList<User> getAllUsers() {
        List<UserEntity> userEntities = userRepository.findAll();

        ArrayList<User> users = new ArrayList<>();

        for (UserEntity entity : userEntities) {
            User user = new User(
                    entity.getId(),
                    entity.getLastName(),
                    entity.getFirstName(),
                    entity.getEmail(),
                    entity.getPhone(),
                    entity.getAddress(),
                    entity.getPassword()
            );
            users.add(user);
        }

        return users;
    }

    @Override
    public User getUserByEmail(String email) {
        UserEntity userEntity = userRepository.findByEmail(email);
        if (userEntity != null) {
            return new User(
                    userEntity.getId(),
                    userEntity.getFirstName(),
                    userEntity.getLastName(),
                    userEntity.getEmail(),
                    userEntity.getPhone(),
                    userEntity.getAddress(),
                    userEntity.getPassword()
            );
        }
        return null;
    }

}
