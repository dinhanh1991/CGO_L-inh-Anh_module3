package com.example.product.model;

public class Product {
    private int id;
    private String name;
    private int price;
    private String description;
    private String productDate;
    private String firm;

    public Product(int id, String name, int price, String description, String productDate, String firm) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.productDate = productDate;
        this.firm = firm;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProductDate() {
        return productDate;
    }

    public void setProductDate(String productDate) {
        this.productDate = productDate;
    }

    public String getFirm() {
        return firm;
    }

    public void setFirm(String firm) {
        this.firm = firm;
    }

}
