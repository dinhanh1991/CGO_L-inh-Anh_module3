package com.example.exam.resposity.product;

import com.example.exam.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    void insertProduct(Product products) throws SQLException;

    Product selectProduct(int id);

    List<Product> selectAllProduct();

    boolean deleteProduct(int id) throws SQLException;

    boolean updateProduct(Product product) throws SQLException;

    List<Product> selectAllProductByName(String name) throws SQLException;

    List<Product> selectAllProductByPrice(double price) throws SQLException;

    List<Product> searchProducts(String name, Double price, String category, String color);
}
