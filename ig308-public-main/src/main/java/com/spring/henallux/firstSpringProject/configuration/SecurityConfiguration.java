package com.spring.henallux.firstSpringProject.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private static final String LOGIN_REQUEST = "/login";
    private static final String[] AUTHORIZED_REQUESTS_ADMIN = new String[]{"/admin"};

    private UserDetailsService userDetailsServiceImpl;
    private BCryptPasswordEncoder passwordEncoder;


    @Autowired
    public SecurityConfiguration(UserDetailsService userDetailsServiceImplementation, BCryptPasswordEncoder passwordEncoder) {
        this.userDetailsServiceImpl = userDetailsServiceImplementation;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                    .antMatchers(AUTHORIZED_REQUESTS_ADMIN).hasRole("ADMIN")
                    .antMatchers("/", "/home", "/public/**", "/register", "/about", "/catalogue", "/hello/welcome", "/processLogin", "/cart", "/cart/add", "/remove", "/clear", "/update", "/add").permitAll()
                    .antMatchers("/images/**", "/css/**", "/js/**").permitAll()
                    .anyRequest().authenticated()
                .and()
                .formLogin()
                    .loginPage(LOGIN_REQUEST)
                    .usernameParameter("email")  // Utiliser "email" comme nom d'utilisateur
                    .passwordParameter("password")
                    .failureUrl("/login?error=true")  // Affiche une erreur si l'authentification échoue
                    .permitAll()
                    .defaultSuccessUrl("/hello/welcome", true)
                .and()
                    .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/hello/welcome")
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                .permitAll();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsServiceImpl).passwordEncoder(passwordEncoder);
    }
}
