package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
@RequestMapping(value = "/login")
public class UserController {

    private final UserDataAccess userDataAccess;

    // Injection du UserDAO
    public UserController(UserDataAccess userDataAccess) {
        this.userDataAccess = userDataAccess;
    }

    @GetMapping("/users")
    public String showAllUsers(Model model) {

        ArrayList<User> users = userDataAccess.getAllUsers();

        // Ajouter la liste des utilisateurs au modèle
        model.addAttribute("users", users);
        System.out.println(users);

        return "integrated:test";
    }
}