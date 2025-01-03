package com.spring.henallux.firstSpringProject.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class User {

    @NotNull(message = "Name cannot be null")
    @Size(min = 2, max = 30, message = "Name must be between 2 and 30 characters")
    private String name;

    @NotNull()
    @Min(value = 1)
    @Max(value = 120)
    private Integer age;


    @NotNull(message = "Gender is required")
    private Boolean male;

    @NotNull(message = "Hobby is required")
    private Hobby hobby;

    public User() {}

    public User(String name, Integer age, Boolean male, Hobby hobby) {
        this.name = name;
        this.age = age;
        this.male = male;
        this.hobby = hobby;
    }

    // Getters et Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Boolean getMale() {
        return male;
    }

    public void setMale(Boolean male) {
        this.male = male;
    }

    public Hobby getHobby() {
        return hobby;
    }

    public void setHobby(Hobby hobby) {
        this.hobby = hobby;
    }
}
