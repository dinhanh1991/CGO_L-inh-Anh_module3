package com.example.customer.model;

public class Customer {
    private String customerName;
    private String customerBirthday;
    private String customerAddress;
    private String image;

    public Customer(String customerName, String customerBirthday, String customerAddress, String image) {
        this.customerName = customerName;
        this.customerBirthday = customerBirthday;
        this.customerAddress = customerAddress;
        this.image = image;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerBirthday() {
        return customerBirthday;
    }

    public void setCustomerBirthday(String customerBirthday) {
        this.customerBirthday = customerBirthday;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
