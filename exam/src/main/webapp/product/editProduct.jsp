<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>

<c:if test="${not empty message}">
  <p>${message}</p>
</c:if>

<form action="product" method="post">
  <input type="hidden" name="id" value="${product.id}">

  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="${product.nameProduct}" required><br><br>

  <label for="price">Price:</label>
  <input type="number" id="price" name="price" value="${product.price}" step="0.01" required><br><br>

  <label for="quantity">Quantity:</label>
  <input type="number" id="quantity" name="quantity" value="${product.quantity}" required><br><br>

  <label for="color">Color:</label>
  <input type="text" id="color" name="color" value="${product.color}" required><br><br>

  <label for="description">Description:</label>
  <textarea id="description" name="description" required>${product.description}</textarea><br><br>

  <label for="categoryId">Category:</label>
  <input type="number" id="categoryId" name="categoryId" value="${product.categoryId}" required><br><br>

  <input type="submit" value="Update Product">

  <input type="hidden" name="action" value="update">
</form>

<br>
<a href="product">Back to Product List</a>
</body>
</html>
