/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.system.model;

/**
 *
 * @author user
 */
import javax.persistence.*;
@Entity
@Table(name="account")
public class Account extends BaseEntity{
    
    @Column(name="username")
    private String username;
    @Column(name="password")
    private String password;
    @Column(name="lvl")
    private int level;
    @Column(name="employeeid")
    private int employeeId;

        public Account(){}

    public Account(String username, String password, int level, int employeeId) {
        this.username = username;
        this.password = password;
        this.level = level;
        this.employeeId = employeeId;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getLevel() {
        return level;
    }
    public void setLevel(int level) {
        this.level = level;
    }
    public int getEmployeeId() {
        return employeeId;
    }
    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", level=" + level + ", employeeId=" + employeeId + '}';
    }
}
