package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    private final UserDataAccess userDataAccess;

    public RegisterController(UserDataAccess userDataAccess) {
        this.userDataAccess = userDataAccess;
    }

    @GetMapping
    public String showRegisterPage(Model model) {
        model.addAttribute("user", new User());
        return "integrated:register";
    }

    @PostMapping
    public String registerUser(@Valid User user, BindingResult bindingResult, Model model, HttpSession session) {

        User existingUser = userDataAccess.getUserByEmail(user.getEmail());
        if (existingUser != null) {
            bindingResult.rejectValue("email", "error.user", "Un utilisateur avec cet email existe déjà.");
        }
        if (bindingResult.hasErrors()) {
            return "integrated:register";
        }
        userDataAccess.saveUser(user);
        if(user.getFirstName()!= null){
            session.setAttribute("user", user);
        }
        return "redirect:/hello/welcome";
    }
}
