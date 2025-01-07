package com.spring.henallux.firstSpringProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

    public CartController() {}

    @GetMapping("/cart")
    public String showCart() { return "integrated:cart"; }
    }

