/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.system.model;

import javax.persistence.*;

/**
 *
 * @author user
 */
@Entity
@Table(name="bulletin")
public class Bulletin extends BaseEntity{
    @Column(name = "message")
    private String message;
    @Column(name = "bulletinsubject")
    private String bulletinSubject;
    @Column(name = "bulletintype")
    private String bulletinType;
    @Column(name = "employeename")
    private String employeeName;
    public Bulletin(){}

    public Bulletin(String message, String bulletinSubject, String bulletinType, String employeeName) {
        this.message = message;
        this.bulletinSubject = bulletinSubject;
        this.bulletinType = bulletinType;
        this.employeeName = employeeName;
    }
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getBulletinType() {
        return bulletinType;
    }

    public void setBulletinType(String bulletinType) {
        this.bulletinType = bulletinType;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getBulletinSubject() {
        return bulletinSubject;
    }

    public void setBulletinSubject(String bulletinSubject) {
        this.bulletinSubject = bulletinSubject;
    }
}
