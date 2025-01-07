package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    private UserDataAccess userDataAccess;

    public ProfileController(UserDataAccess userDataAccess) {
        this.userDataAccess = userDataAccess;
    }

    @GetMapping("/profile")
    public String showProfile(Model model) {
        User currentUser = userDataAccess.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("user", currentUser);
        return "integrated:profile";
    }
}
