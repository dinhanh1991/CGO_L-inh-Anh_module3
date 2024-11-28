package com.example.caculator.controler;

import com.example.caculator.model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Calculator",value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
            double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
            String operator = request.getParameter("operator");

            double result = Calculator.calculate(firstOperand, secondOperand, operator);

            request.setAttribute("result", result);
            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("operator", operator);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (ArithmeticException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
