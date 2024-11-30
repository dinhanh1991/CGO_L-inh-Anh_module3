<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        center {
            margin-top: 30px;
        }

        h1 {
            color: #4CAF50;
        }

        h2 {
            color: #2C3E50;
        }

        a {
            text-decoration: none;
            color: #3498db;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 5px;
            margin: 5px;
        }

        a:hover {
            background-color: #3498db;
            color: white;
        }
        form {
            margin: 20px 0;
            padding: 20px;
            background-color: #ecf0f1;
            border-radius: 8px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        input[type="text"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2C3E50;
            color: white;
        }

        td {
            background-color: #ecf0f1;
        }

        @media screen and (max-width: 600px) {
            table {
                width: 100%;
            }
            th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a> |
        <a href="/users?action=sort">Sort by Name</a>
    </h2>
</center>

<!-- Form tìm kiếm theo country -->
<div align="center">
    <form method="get" action="/users">
        <input type="hidden" name="action" value="search"/>
        <label for="country">Search by Country:</label>
        <input type="text" name="country" id="country"/>
        <input type="submit" value="Search"/>
    </form>
</div>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>