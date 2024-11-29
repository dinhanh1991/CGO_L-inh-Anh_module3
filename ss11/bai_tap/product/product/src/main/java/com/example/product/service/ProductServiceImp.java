package com.example.product.service;

import com.example.product.model.Product;

import java.util.*;

public class ProductServiceImp implements ProductService {
    private static Map<Integer,Product> products;
    static {
        products=new HashMap<>();
        products.put(1,new Product(1,"Sony xperia 1",15000000,"White","12/07/2024","Sony"));
        products.put(2,new Product(2,"Samsung galaxy S8",17000000,"Black","24/09/2024","SamSung"));
        products.put(3,new Product(3,"Iphone 14",25000000,"Pink","25/08/2024","Apple"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }
    public Product findByName(String name) {
        for (Product product : products.values()) {
            if (product.getName().equals(name)) {
                return product;
            }
        }
        return null;
    }
}
