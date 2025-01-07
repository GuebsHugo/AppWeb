package com.spring.henallux.firstSpringProject.service;

import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {

    private UserDataAccess userDataAccess;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserDetailsServiceImplementation(UserDataAccess userDataAccess, BCryptPasswordEncoder passwordEncoder) {
        this.userDataAccess = userDataAccess;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public User loadUserByUsername(String email) throws UsernameNotFoundException {
        // Récupérer l'utilisateur
        User user = userDataAccess.getUserByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("Utilisateur non trouvé");
        }
        return user;
    }
}

