package com.spring.henallux.firstSpringProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/logout")
public class LogoutController {

    @RequestMapping
    public String logout(HttpSession session) {
        session.removeAttribute("user");

        return "redirect:/hello/welcome";
    }
}
