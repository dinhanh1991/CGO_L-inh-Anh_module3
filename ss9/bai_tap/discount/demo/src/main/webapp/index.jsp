<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/discount">
    <label>Product Description: </label>
    <input type="text" name="description"><br>
    <label>List Price</label>
    <input type="number" name="price"><br>
    <label>Discount Percent</label>
    <input type="number" name="percent"><br>
    <input type="submit" value="Done">
</form>
</body>
</html>