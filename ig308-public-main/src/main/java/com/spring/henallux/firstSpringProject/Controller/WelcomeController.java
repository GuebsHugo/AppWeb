package com.spring.henallux.firstSpringProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/hello")
public class WelcomeController {

    public WelcomeController() {}

    @RequestMapping(value = "/welcome")
    public String showForm(Model model) {
        return "integrated:welcome";
    }
}