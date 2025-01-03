package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.Constants;
import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import com.spring.henallux.firstSpringProject.model.User;
import com.spring.henallux.firstSpringProject.service.HobbiesService;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Locale;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes({Constants.CURRENT_USER})
public class InscriptionController {

    private final UserDataAccess userDataAccess;
    private final HobbiesService hobbiesService;

    public InscriptionController(HobbiesService hobbiesService, UserDataAccess userDataAccess) {
        this.userDataAccess = userDataAccess;
        this.hobbiesService = hobbiesService;
    }

    @GetMapping
    public String getForm(Model model) {
        model.addAttribute("hobbies", hobbiesService.getHobbys());  // Ajouter les hobbies à la vue
        model.addAttribute("currentUser", new User());
        return "integrated:userInscription";
    }

    @PostMapping
    public String getFormData(@Valid @ModelAttribute(value = Constants.CURRENT_USER) User user,
                              final BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors()) {
            userDataAccess.save(user);
            return "redirect:/gift/get";
        } else {
            model.addAttribute("currentUser", user);
            model.addAttribute("hobbies", hobbiesService.getHobbys());
            return "integrated:userInscription";
        }
    }
}
