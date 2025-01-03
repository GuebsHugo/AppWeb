package com.spring.henallux.firstSpringProject.service;

import com.spring.henallux.firstSpringProject.model.Hobby;
import org.springframework.stereotype.Service;

@Service
public class GiftService {

    public String chooseGift(String hobby, int age) {
        if (hobby == null || hobby.isEmpty()) {
            throw new IllegalArgumentException("Hobby name cannot be null or empty");
        }
        if (age <= 0) {
            throw new IllegalArgumentException("Age must be greater than zero");
        }

        if (age < 5) {
            return "Un puzzle concernant le hobby: " + hobby;
        } else if (age >= 5 && age <= 10) {
            return "Un DVD sur le hobby: " + hobby;
        } else {
            return "Un livre sur le hobby: " + hobby;
        }
    }
}
