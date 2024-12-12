package com.example.exam.service;

import com.example.exam.model.Product;
import com.example.exam.resposity.product.ProductDAO;
import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductDAO productDAO;

    public ProductService() {
        productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() throws SQLException {
        return productDAO.selectAllProduct();
    }

    public boolean addProduct(Product product) throws SQLException {
        productDAO.insertProduct(product);
        return true;
    }

    public boolean updateProduct(Product product) throws SQLException {
        return productDAO.updateProduct(product);
    }

    public boolean deleteProduct(int id) throws SQLException {
        return productDAO.deleteProduct(id);
    }

    public List<Product> searchProducts(String name, Double price, String category, String color) throws SQLException {
        return productDAO.searchProducts(name, price, category, color);
    }

    public Product getProductById(int id) throws SQLException {
        return productDAO.selectProduct(id);
    }
}
