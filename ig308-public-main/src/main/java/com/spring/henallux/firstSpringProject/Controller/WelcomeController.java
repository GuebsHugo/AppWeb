package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/hello")
public class WelcomeController {

    public WelcomeController() {}

    @RequestMapping(value = "/welcome")
    public String showForm(HttpSession session) {
        User user = (User) session.getAttribute("user");

        return "integrated:welcome";
    }
}