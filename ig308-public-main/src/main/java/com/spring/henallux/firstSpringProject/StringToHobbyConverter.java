package com.spring.henallux.firstSpringProject;

import com.spring.henallux.firstSpringProject.model.Hobby;
import com.spring.henallux.firstSpringProject.service.HobbiesService;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToHobbyConverter implements Converter<String, Hobby> {

    private final HobbiesService hobbiesService;

    public StringToHobbyConverter(HobbiesService hobbiesService) {
        this.hobbiesService = hobbiesService;
    }

    @Override
    public Hobby convert(String source) {
        if (source == null || source.isEmpty()) {
            return null;
        }
        return hobbiesService.getHobbys().stream()
                .filter(hobby -> hobby.getId().equals(source))
                .findFirst()
                .orElse(null); // Retourne null si aucun hobby trouvé
    }
}