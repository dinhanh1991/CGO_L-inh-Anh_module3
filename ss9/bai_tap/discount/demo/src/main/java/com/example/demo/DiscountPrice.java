package com.example.demo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountPrice",value = "/discount")
public class DiscountPrice extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Double.parseDouble(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));
        double discountPrice = price * percent*0.01;
        String description = request.getParameter("description");
        PrintWriter writer = response.getWriter();
        writer.println("<html><body>");
        writer.println("<h2> Description :"+description+"</h2>");
        writer.println("<h2> Price :"+price+"</h2>");
        writer.println("<h2> Percent :"+percent+"</h2>");
        writer.println("<h2>Discount Price: "+ discountPrice+"</h2>");
        writer.println("<h2> Remaining Discount: "+ (price-discountPrice) +"</h2>");
        writer.println("</body></html>");
    }
}

