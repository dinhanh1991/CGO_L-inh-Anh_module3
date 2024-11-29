package com.example.product.controller;

import com.example.product.model.Product;
import com.example.product.model.validate.Validate;
import com.example.product.service.ProductServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product",value = "/product")
public class ProductServlet extends HttpServlet {
    private final Validate validate = new Validate();
    private final ProductServiceImp productService = new ProductServiceImp();
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(req,resp);
                break;
                case "update":
                    updateProduct(req,resp);
                    break;
                    case "delete":
                        deleteProduct(req,resp);
                        break;
                        default:
                            break;
        }
    }
    public void createProduct(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        int price = Integer.parseInt(req.getParameter("price"));
        String description = req.getParameter("description");
        String date = req.getParameter("date");
        while (!validate.isValidDate(date)) {
            req.setAttribute("message", "Invalid date format. Please enter a valid date.");
             date = req.getParameter("date");
        }
        String firm = req.getParameter("firm");
        int id =(int) Math.round(Math.random()*10000);
        Product product = new Product(id, name, price, description, date, firm);
        this.productService.save(product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("products/create.jsp");
        req.setAttribute("message", "New product was created");
        try {
           requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void updateProduct(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        int price = Integer.parseInt(req.getParameter("price"));
        String description = req.getParameter("description");
        String date = req.getParameter("date");
        while (!validate.isValidDate(date)) {
            date = req.getParameter("date");
        }
        String firm = req.getParameter("firm");
        int id =Integer.parseInt(req.getParameter("id"));
        Product product =this.productService.findById(id);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("products/update.jsp");
        if (product == null) {
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setFirm(firm);
            product.setProductDate(date);
            this.productService.update(id, product);
            req.setAttribute("product", product);
            req.setAttribute("message", "Product was updated");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = this.productService.findById(id);
        if (product == null) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("error-404.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            this.productService.delete(id);
            req.setAttribute("message", "Product was deleted successfully");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product");
            try {
                requestDispatcher.forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String action = req.getParameter("action");
      if (action == null) {
          action = "";
      }
      switch (action) {
          case "create":
              showCreateForm(req,resp);
              break;
              case "update":
                  showUpdateForm(req,resp);
                  break;
                  case "delete":
                      showDeleteForm(req,resp);
                      break;
                      case "view":
                          viewProduct(req,resp);
                          break;
                      default:
                          listProduct(req,resp);
                          break;
      }
    }
    public void viewProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher requestDispatcher ;
        if (product == null) {
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product", product);
            requestDispatcher= req.getRequestDispatcher("products/view.jsp");
        }
        try {
            requestDispatcher.forward(req,resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher requestDispatcher ;
        if (product == null) {
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product", product);
            requestDispatcher= req.getRequestDispatcher("products/delete.jsp");
        }
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public void showUpdateForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher requestDispatcher ;
        if (product == null) {
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product", product);
            requestDispatcher= req.getRequestDispatcher("products/update.jsp");
        }
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("products/create.jsp") ;
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public void listProduct(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> products = this.productService.findAll();
        req.setAttribute("products", products);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("products/list.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
