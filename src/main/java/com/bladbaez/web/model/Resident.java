package com.bladbaez.web.model;

public class Resident {
    private int id;
    private String firstName;
    private String lastName;
    private String address;
    private String town;
    private String province;
    private String country;

    public Resident(int id, String firstName, String lastName, String address, String town, String province, String country) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.town = town;
        this.province = province;
        this.country = country;
    }

    public Resident(int id, String firstName, String lastName, String town, String province, String country) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.town = town;
        this.province = province;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
