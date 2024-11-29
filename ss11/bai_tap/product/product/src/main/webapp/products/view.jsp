
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
    <style>
        body {
            background-color: #f4f4f9;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
<h1>Product detail</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name:</td>
        <td>${requestScope["product"].name}</td>
    </tr>
    <tr>
        <td> Price:</td>
        <td>${requestScope["product"].price}</td>
    </tr>
    <tr>
        <td>Description :</td>
        <td>${requestScope["product"].description}</td>
    </tr>
    <tr>
    <td>Product Date: </td>
    <td>${requestScope["product"].productDate}</td>
    </tr>
    <tr>
    <td>Product Firm: </td>
    <td>${requestScope["product"].firm}</td>
    </tr>
</table>
</body>
</html>
