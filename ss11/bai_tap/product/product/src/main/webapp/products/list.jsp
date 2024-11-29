<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 28/11/2024
  Time: 10:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        h1, h2, p {
            text-align: center;
            margin-top: 20px;
            color: #444;
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            display: inline-block;
        }

        a:hover {
            background-color: #0056b3;
        }

        p a {
            margin: 20px auto;
            display: block;
            width: fit-content;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
            border-bottom: 3px solid #ddd;
        }

        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }

        button:hover {
            opacity: 0.9;
        }

        a button {
            display: inline-block;
        }

        button {
            background-color: #28a745;
            color: #fff;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #218838;
        }


        a[href*="delete"] button {
            background-color: #dc3545;
            color: white;
        }

        a[href*="delete"] button:hover {
            background-color: #c82333;
        }

        body p {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<p>
    <a href="/product?action=create">Create new Product</a>
</p>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Product Date</th>
        <th> Firm</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
        <td><a href="/product?action=view&id=${product.id}">${product.name}</a></td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.productDate}</td>
        <td>${product.firm}</td>
        <td><a href="/product?action=update&id=${product.id}">
            <button>Update</button>
        </a></td>
        <td><a href="/product?action=delete&id=${product.id}">
            <button>Delete</button>
        </a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
