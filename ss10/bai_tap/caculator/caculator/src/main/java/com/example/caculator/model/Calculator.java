package com.example.caculator.model;

public class Calculator {
    public static double calculate(double a, double b, String operator) throws ArithmeticException {
        switch (operator) {
            case "add":
                return a + b;
            case "subtract":
                return a - b;
            case "multiply":
                return a * b;
            case "divide":
                if (b == 0) {
                    throw new ArithmeticException("Cannot divide by zero");
                }
                return a / b;
            default:
                throw new IllegalArgumentException("Invalid operator");
        }
    }
}
