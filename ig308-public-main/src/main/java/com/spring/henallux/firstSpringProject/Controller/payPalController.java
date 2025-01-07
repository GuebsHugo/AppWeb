package com.spring.henallux.firstSpringProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/paypal")
public class payPalController {

    @GetMapping()
    public String showCart(Model model) {
        String paypalBusinessEmail = "sb-ubnzz14643259@business.example.com";
        String itemName = "vap";
        String amount = "100.00";
        String currencyCode = "EUR";
        String returnUrl = "http://localhost:8082/hello/welcome";
        String cancelUrl = "http://localhost:8082/hello/welcome";

        model.addAttribute("paypalBusinessEmail", paypalBusinessEmail);
        model.addAttribute("itemName", itemName);
        model.addAttribute("amount", amount);
        model.addAttribute("currencyCode", currencyCode);
        model.addAttribute("returnUrl", returnUrl);
        model.addAttribute("cancelUrl", cancelUrl);

        return "integrated:paypal";
    }

    @PostMapping
    public String processPayment(Model model) {
        return "paymentSuccess";
    }
}
