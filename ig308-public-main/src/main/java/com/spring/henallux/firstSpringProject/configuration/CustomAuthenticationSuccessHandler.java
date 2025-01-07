package com.spring.henallux.firstSpringProject.configuration;

import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        // Récupérer l'utilisateur principal, qui est une instance de UserDetails
        Object principal = authentication.getPrincipal();

        // Si principal est une instance de User (ou votre classe implémentant UserDetails)
        if (principal instanceof User) {
            User user = (User) principal;
            System.out.println(user);
            // Ajouter l'utilisateur à la session
            request.getSession().setAttribute("user", user);
        }

        // Rediriger l'utilisateur après une connexion réussie
        response.sendRedirect("/hello/welcome");
    }
}
