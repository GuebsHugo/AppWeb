package com.spring.henallux.firstSpringProject.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private static final String LOGIN_REQUEST = "/login";
    private static final String[] AUTHORIZED_REQUESTS_ADMIN = new String[]{"/admin"};
    private UserDetailsService userDetailsServiceImpl;

    @Autowired
    public SecurityConfiguration(UserDetailsService userDetailsServiceImplementation) {
        this.userDetailsServiceImpl = userDetailsServiceImplementation;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http
                .authorizeRequests()
                    .antMatchers(AUTHORIZED_REQUESTS_ADMIN).hasRole("ADMIN")
                    .antMatchers("/", "/home", "/public/**", "/register", "/about", "/catalogue", "/hello/welcome", "/processLogin", "/cart", "/cart/add", "/remove", "/clear", "/update", "/add").permitAll() // Ces pages sont accessibles sans authentification
                    .anyRequest().authenticated()
                .and()
                .formLogin()
                    .successHandler(new SavedRequestAwareAuthenticationSuccessHandler())
                    .loginPage(LOGIN_REQUEST)
                    .usernameParameter("email")  // Utilise "email" au lieu de "username"
                    .passwordParameter("password")
                    .failureUrl("/login")  // URL de redirection en cas d'échec de l'authentification
                    .permitAll()
                    .defaultSuccessUrl("/hello/welcome", true)
                .and()
                .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/hello/welcome")
                    .invalidateHttpSession(true) // supprime a session
                    .clearAuthentication(true)
                    .permitAll();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsServiceImpl).passwordEncoder(new BCryptPasswordEncoder());
    }

}