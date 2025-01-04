package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    private final UserDataAccess userDataAccess;

    public LoginController(UserDataAccess userDataAccess) {
        this.userDataAccess = userDataAccess;
    }

    @GetMapping
    public String showLoginPage() {
        return "integrated:login";
    }

    @PostMapping
    public String loginUser(@RequestParam("email") String email,
                            @RequestParam("password") String password,
                            Model model,
                            HttpSession session) {
        User user = userDataAccess.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);
            return "redirect:/hello/welcome";
        } else {
            model.addAttribute("error", "Identifiant ou Mot de passe incorrect");
            return "integrated:login";
        }
    }
}