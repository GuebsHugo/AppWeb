package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.Constants;
import com.spring.henallux.firstSpringProject.model.Hobby;
import com.spring.henallux.firstSpringProject.model.User;
import com.spring.henallux.firstSpringProject.service.GiftService;
import com.spring.henallux.firstSpringProject.service.HobbiesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/gift")
@SessionAttributes({Constants.CURRENT_USER})
public class GiftController {

    private GiftService giftService;

    public GiftController(GiftService giftService) {
        this.giftService = giftService;
    }

    @GetMapping("/get")
    public String home(Model model, @SessionAttribute(Constants.CURRENT_USER) User user) {
        int age = user.getAge();
        Hobby hobby = user.getHobby();
        model.addAttribute("gift", giftService.chooseGift(hobby.getName(), age)); // Utilisez le nom du hobby
        return "integrated:gift";  // Assurez-vous que la vue est correctement résolue
    }

}

