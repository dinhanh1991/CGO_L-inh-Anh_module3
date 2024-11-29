<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Verdana', sans-serif;
        }

        h1 {
            color: #007bff;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"], input[type="number"] {
            padding: 8px;
            margin: 5px;
            width: 250px;
        }

        button {
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<h1>Update Product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form action="/product?action=update" method="post">
    <input type="hidden" name="id" value="${product.getId()}">
    <label for="name">Product Name:</label>
    <input type="text" id="name" name="name" value="${product.getName()}" required>
    <br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" value="${product.getPrice()}" required>
    <br>

    <label for="description">Description:</label>
    <textarea id="description" name="description">${product.getDescription()}</textarea>
    <br>

    <label for="date">Product Date:</label>
    <input type="text" id="date" name="date" value="${product.getProductDate()}" required>
    <br>

    <label for="firm">Firm:</label>
    <input type="text" id="firm" name="firm" value="${product.getFirm()}" required>
    <br>

    <button type="submit">Update Product</button>
</form>
</body>
</html>
