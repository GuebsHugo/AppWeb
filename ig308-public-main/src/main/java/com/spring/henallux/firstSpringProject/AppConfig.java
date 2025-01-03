package com.spring.henallux.firstSpringProject;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppConfig implements WebMvcConfigurer {

    private final StringToHobbyConverter stringToHobbyConverter;

    public AppConfig(StringToHobbyConverter stringToHobbyConverter) {
        this.stringToHobbyConverter = stringToHobbyConverter;
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(stringToHobbyConverter);
    }
}
