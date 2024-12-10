<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search Classes</title>
</head>
<body>
<h1>Search Classes</h1>
<form action="classes?action=search" method="post">
    <input type="text" name="query" placeholder="Enter class name or keyword" required>
    <button type="submit">Search</button>
</form>
</body>
</html>