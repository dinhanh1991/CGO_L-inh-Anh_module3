<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
    <style>
        body {
            background-color: #e9f7ef;
            font-family: 'Tahoma', sans-serif;
        }

        h1 {
            color: #28a745;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            padding: 8px;
            margin: 5px;
            width: 250px;
        }

        button {
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<h1>Create New Product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form action="/product?action=create" method="post">
    <label for="name">Product Name:</label>
    <input type="text" id="name" name="name" required>
    <br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" required>
    <br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea>
    <br>

    <label for="date">Product Date:</label>
    <input type="text" id="date" name="date" required>
    <br>

    <label for="firm">Firm:</label>
    <input type="text" id="firm" name="firm" required>
    <br>

    <button type="submit">Create Product</button>
</form>

<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
</body>
</html>
