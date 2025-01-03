package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.MagicKeyDataAccess;
import com.spring.henallux.firstSpringProject.model.MagicKeyForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping(value = "/hello")
public class WelcomeController {

    private final MagicKeyDataAccess magicKeyDataAccess;

    public WelcomeController(MagicKeyDataAccess magicKeyDataAccess) {
        this.magicKeyDataAccess = magicKeyDataAccess;
    }

    @RequestMapping(value = "/welcome")
    public String showForm(Model model) {
        model.addAttribute("magicKeyForm", new MagicKeyForm());
        return "integrated:welcome";
    }

    @PostMapping("/send")
    public String getFormData(@ModelAttribute(value = "magicKeyForm") MagicKeyForm form){
        ArrayList<String> validMagicKeys = magicKeyDataAccess.getMagicKeys();

        if(validMagicKeys.contains(form.getMagicKey())){
                return "redirect:/user";
        } else {
            return "integrated:keyError";
        }
    }

}