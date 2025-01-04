package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.model.User;

import java.util.ArrayList;

public interface UserDataAccess{
    ArrayList<User> getAllUsers();
    User getUserByEmail(String email);
    void saveUser(User user);
}
