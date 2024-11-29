<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Delete Product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form action="/product?action=delete" method="post">
    <input type="hidden" name="id" value="${product.getId()}">
    <p>Are you sure you want to delete the product <strong>${product.getName()}</strong>?</p>
    <button type="submit">Yes, Delete</button>
    <a href="/product">No, Go back</a>
</form>
</body>
</html>
