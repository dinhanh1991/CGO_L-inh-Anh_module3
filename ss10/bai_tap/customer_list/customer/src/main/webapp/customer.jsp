<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 26/11/2024
  Time: 11:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Customer_List</title>
    <style>
      /* CSS cho bảng "Danh sách khách hàng" */
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f5f8fa;
      }

      h1 {
        text-align: center;
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
      }

      .table-container {
        max-width: 800px;
        margin: 0 auto;
        border: 1px solid #d1d1d1;
        border-radius: 8px;
        overflow: hidden;
        background-color: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      table {
        width: 100%;
        border-collapse: collapse;
        margin: 0;
      }

      thead {
        background-color: #007bff;
        color: white;
      }

      thead th {
        padding: 10px;
        text-align: left;
        font-weight: bold;
        font-size: 16px;
      }

      tbody tr:nth-child(even) {
        background-color: #f9f9f9;
      }

      tbody tr:nth-child(odd) {
        background-color: #ffffff;
      }

      td {
        padding: 10px;
        vertical-align: middle;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
        color: #555;
      }

      tbody td img {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 4px;
      }

      .tbody td {
        text-align: center;
      }

      tfoot {
        background-color: #f5f8fa;
      }

    </style>
  </head>
  <body>
  <h1>Customer List</h1>
  <table>
    <tr>
      <th>No</th>
      <th>Customer Name</th>
      <th>Customer Birthday</th>
      <th>Customer address</th>
      <th>Picture</th>
    </tr>
    <c:forEach items="${list}" var="c" varStatus="loop">
      <tr>
        <td>${loop.count}</td>
        <td>${c.customerName}</td>
        <td>${c.customerBirthday}</td>
        <td>${c.customerAddress}</td>
        <td><img src="${c.image}" alt="Customer Image" width="50" height="50"></td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
