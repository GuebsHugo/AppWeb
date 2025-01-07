package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import com.spring.henallux.firstSpringProject.dataAccess.repository.UserRepository;
import com.spring.henallux.firstSpringProject.dataAccess.util.ProviderConverter;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserDAO implements UserDataAccess{

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    private UserRepository userRepository;
    private ProviderConverter providerConverter;

    public UserDAO(UserRepository userRepository, ProviderConverter providerConverter) {
        this.userRepository = userRepository;
        this.providerConverter = providerConverter;
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
            return providerConverter.userEntityToUserModel(userEntity);
        }
        return null;
    }

    @Override

    public void saveUser(User user) {
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);

        UserEntity userEntity = providerConverter.userModelToUserEntity(user);
        userRepository.save(userEntity);
    }

}
