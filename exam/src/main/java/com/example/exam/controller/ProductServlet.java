package com.example.exam.controller;

import com.example.exam.model.Product;
import com.example.exam.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        try {
            if (action == null) {
                listProducts(request, response);
            } else if (action.equals("edit")) {
                editProduct(request, response);
            } else if (action.equals("delete")) {
                deleteProduct(request, response);
            } else if (action.equals("search")) {
                searchProducts(request, response);
            } else {
                showMessage(request, response, "Unknown action!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        try {
            if (action.equals("add")) {
                addProduct(request, response);
            } else if (action.equals("update")) {
                updateProduct(request, response);
            } else {
                showMessage(request, response, "Unknown action!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList = productService.getAllProducts();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("product/productList.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductById(productId);
        request.setAttribute("product", product);
        request.getRequestDispatcher("product/editProduct.jsp").forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        boolean result = productService.deleteProduct(productId);
        if (result) {
            request.setAttribute("message", "Product deleted successfully!");
        } else {
            request.setAttribute("message", "Failed to delete product.");
        }
        listProducts(request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(name, price, quantity, color, description, categoryId);
        productService.addProduct(product);

        request.setAttribute("message", "Product added successfully!");
        listProducts(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(id, name, price, quantity, color, description, categoryId);
        productService.updateProduct(product);

        request.setAttribute("message", "Product updated successfully!");
        listProducts(request, response);
    }

    private void showMessage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("/product/productList.jsp").forward(request, response);
    }
    private void searchProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String priceParam = request.getParameter("price");
        Double price = (priceParam != null && !priceParam.isEmpty()) ? Double.parseDouble(priceParam) : null;
        String category = request.getParameter("category");
        String color = request.getParameter("color");

        List<Product> productList = productService.searchProducts(name, price, category, color);
        request.setAttribute("products", productList);
        request.getRequestDispatcher("/product/productList.jsp").forward(request, response);
    }
}
