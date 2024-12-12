<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Product List</title>
</head>
<body>
<h1>Management List</h1>
<a href="/product?action=add">Add New Product</a>
<form>
   Product Name:<input type ="search" name="name" value="name" placeholder="Product Name">
   Product price:<input type ="search" name="price" value="price" placeholder="Product price">
   Product Category:<input type ="search" name="category" value="category" placeholder="Category">
   Product Color:<input type ="search" name="color" value="color" placeholder=" Color">
 <button>clear</button>
  <button type="submit">Search</button>
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
