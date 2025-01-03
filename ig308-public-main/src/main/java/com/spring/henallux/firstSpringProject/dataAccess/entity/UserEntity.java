package com.spring.henallux.firstSpringProject.dataAccess.entity;

import com.spring.henallux.firstSpringProject.model.Hobby;

import javax.persistence.*;

@Entity
@Table(name = "user") // Table name in the database
public class UserEntity {
    @Id
    @Column(name = "name")
    private String name;

    @Column(name = "age")
    private int age;

    @Column(name = "male")
    private boolean male;

    @Column(name = "hobby")
    @Basic(optional = true)
    private String hobby;

    public UserEntity() {

    }

    public UserEntity(String name, int age, boolean male, String hobby) {
        setName(name);
        setAge(age);
        setMale(male);
        setHobby(hobby);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isMale() {
        return male;
    }

    public void setMale(boolean male) {
        this.male = male;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
       this.hobby = hobby;
    }

}
