<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Result:</h1>
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p style="color: red;"><%= error %>
</p>
<%
} else {
    double firstOperand = (Double) request.getAttribute("firstOperand");
    double secondOperand = (Double) request.getAttribute("secondOperand");
    String operator = (String) request.getAttribute("operator");
    double result = (Double) request.getAttribute("result");

  String operatorSymbol = "?";
  switch (operator) {
    case "add":
      operatorSymbol = "+";
      break;
    case "subtract":
      operatorSymbol = "-";
      break;
    case "multiply":
      operatorSymbol = "*";
      break;
    case "divide":
      operatorSymbol = "/";
      break;
  }
%>
<p><%= firstOperand %> <%= operatorSymbol %> <%= secondOperand %> = <%= result %>
</p>
<%
    }
%>
<a href="index.jsp">Back</a>
</body>
</html>
