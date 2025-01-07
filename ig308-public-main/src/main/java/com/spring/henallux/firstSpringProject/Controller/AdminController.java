package com.spring.henallux.firstSpringProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
    @RequestMapping(method = RequestMethod.GET)
    public String admin(Model model) {
        return "integrated:admin";
    }
}
