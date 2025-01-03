package com.spring.henallux.firstSpringProject.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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