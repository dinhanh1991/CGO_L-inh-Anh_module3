<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Add Product</title>
</head>
<body>
<h1>Add New Product</h1>
<form action="/product" method="post">
  <input type="hidden" name="action" value="add">
  <label>Name:</label>
  <input type="text" name="name" required><br>
  <label>Price:</label>
  <input type="number" name="price" required><br>
  <label>Quantity:</label>
  <input type="number" name="quantity" required><br>
  <label>Color:</label>
  <input type="text" name="color" required><br>
  <label>Description:</label>
  <textarea name="description"></textarea><br>
  <label>Category ID:</label>
  <input type="number" name="categoryId" required><br>
  <button type="submit">Add Product</button>
</form>
</body>
</html>
