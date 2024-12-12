<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Product List</title>
</head>
<body>
<h1>Management List</h1>
<a href="/product/addProduct.jsp?action=add">Add New Product</a>
<form action="product?action=search" method="get">
  Product Name: <input type="search" name="name" placeholder="Product Name" value="${product.name}">
  Product Price: <input type="search" name="price" placeholder="Product Price"value="${product.price}">
  Product Category: <input type="search" name="category" placeholder="Category" value="${product.categoryId}">
  Product Color: <input type="search" name="color" placeholder="Color"value="${product.color}">
  <button type="submit">Search</button>
  <button type="reset">Clear</button>
</form>
<table border="1">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Color</th>
    <th>Description</th>
    <th>Category</th>
    <th>Action</th>
  </tr>
  <c:forEach var="product" items="${products}" varStatus="status">
    <tr>
      <td>${product.id}</td>
      <td>${product.nameProduct}</td>
      <td>${product.price}</td>
      <td>${product.quantity}</td>
      <td>${product.color}</td>
      <td>${product.description}</td>
      <td>${product.categoryId}</td>
      <td>
        <a href="product?action=edit&id=${product.id}">Edit</a> |
        <a href="product?action=delete&id=${product.id}" onclick="return confirm('Are you sure?')">Delete</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
