package com.spring.henallux.firstSpringProject.configuration;

import com.spring.henallux.firstSpringProject.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String username = authentication.getName();
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        System.out.println("Utilisateur authentifié : " + username);
        // Ajouter des informations personnalisées à la session (par exemple, un objet 'user')
        session.setAttribute("user", userDetails);

        // Vous pouvez aussi ajouter des informations supplémentaires à la session si nécessaire
        session.setAttribute("userRole", userDetails.getAuthorities());

        // Redirection vers une page après la connexion réussie
        response.sendRedirect("/hello/welcome");
    }
}



