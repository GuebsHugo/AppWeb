package com.spring.henallux.firstSpringProject.Controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/authenticated")
public class AuthenticatedController {
    @RequestMapping(method = RequestMethod.GET)
    public String authenticated(Authentication authentication) {
        // System.out.println(((User)authentication.getPrincipal()).getUsername());
        return "integrated:authenticated";
    }
}