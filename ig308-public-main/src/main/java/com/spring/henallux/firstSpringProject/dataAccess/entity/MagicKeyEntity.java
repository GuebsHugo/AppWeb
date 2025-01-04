package com.spring.henallux.firstSpringProject.dataAccess.entity;

import javax.persistence.*;

@Entity
@Table(name = "magickey") // Table name in the database
public class MagicKeyEntity {

    @Id
    @Column(name = "magicvalue")
    private String magicValue;

    public MagicKeyEntity() {
    }

    public String getMagicValue() {
        return magicValue;
    }

    public void setMagicValue(String magicValue) {
        this.magicValue = magicValue;
    }
}