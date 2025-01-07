package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.model.User;

import java.util.ArrayList;

public interface UserDataAccess{
    User getUserByEmail(String email);
    void saveUser(User user);
}
