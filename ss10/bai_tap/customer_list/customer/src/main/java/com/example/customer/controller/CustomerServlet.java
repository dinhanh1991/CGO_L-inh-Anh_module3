package com.example.customer.controller;

import com.example.customer.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Customer", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static final List<Customer> list = new ArrayList<>();
    static {
        list.add(new Customer("Hanh","24/04/2000","Thai Thuy, Thái Bình","hanh.jpg"));
        list.add(new Customer("Huy","25/08/2001","Kinh Mon, Hai Dương","huy.jpg"));
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", list);
        req.getRequestDispatcher("/customer.jsp").forward(req, resp);
    }

    @Override
   public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", list);
        req.getRequestDispatcher("/customer.jsp").forward(req, resp);
    }
}
