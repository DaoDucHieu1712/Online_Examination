/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Account {

    private int id;
    private String full_name;
    private boolean gender;
    private Date dob;
    private String phone;
    private String address;
    private String email;
    private String password;
    private Group group;
    private ArrayList<Feature> features = new ArrayList<>();

    public Account(int id, String full_name, boolean gender, Date dob, String phone, String address, String email, String password, Group group) {
        this.id = id;
        this.full_name = full_name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.password = password;
        this.group = group;
    }

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public ArrayList<Feature> getFeatures() {
        return features;
    }

    public void setFeatures(ArrayList<Feature> features) {
        this.features = features;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", full_name=" + full_name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", address=" + address + ", email=" + email + ", password=" + password + ", group=" + group.getId() + ", features=" + features + '}';
    }

}
