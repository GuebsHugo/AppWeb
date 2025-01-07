package com.spring.henallux.firstSpringProject.service;

import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
    private UserDataAccess userDataAccess;

    @Autowired
    public UserDetailsServiceImplementation(UserDataAccess userDataAccess) {
        this.userDataAccess = userDataAccess;
    }
    public User loadUserByUsername(String email) throws UsernameNotFoundException {
        System.out.println(email);
        User user =  userDataAccess.getUserByEmail(email);
        System.out.println(user);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }
}

