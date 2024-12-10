package com.demo.test.controller;

import com.demo.test.model.Product;
import com.demo.test.model.User;
import com.demo.test.service.categories.CategoriesService;
import com.demo.test.service.categories.ICategoriesService;
import com.demo.test.service.product.IProductService;
import com.demo.test.service.product.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "index", urlPatterns = "/index")
public class IndexServlet extends HttpServlet {
    private IProductService iProductService;
    private ICategoriesService iCategoriesService;

    @Override
    public void init() throws ServletException {
        iProductService = new ProductService();
        iCategoriesService = new CategoriesService();
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "listProducts";
        }
        switch (action) {
            default:
                listProducts(req, resp);
                break;
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "listProducts";
        }
        switch (action) {
            default:
                listProducts(req, resp);
                break;
        }
    }

    private void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        String searchKeyword = req.getParameter("searchProduct");
        List<Product> listProducts;

        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            listProducts = iProductService.searchProduct(searchKeyword.trim());

            if (listProducts.isEmpty()) {
                session.setAttribute("errorMessage", "Không tìm thấy!");
            }
        } else {
            listProducts = iProductService.findAllProducts();
        }

        req.setAttribute("listProducts", listProducts);
        RequestDispatcher dispatcher = req.getRequestDispatcher("index/products/allProduct.jsp");
        dispatcher.forward(req, resp);
    }

}
