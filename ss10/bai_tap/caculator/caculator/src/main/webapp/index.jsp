<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="post">
  <label>First operand:</label>
  <input type="number" name="firstOperand" required><br><br>

  <label>Operator:</label>
  <select name="operator">
    <option value="add">Addition</option>
    <option value="subtract">Subtraction</option>
    <option value="multiply">Multiplication</option>
    <option value="divide">Division</option>
  </select><br><br>

  <label>Second operand:</label>
  <input type="number" name="secondOperand" required><br><br>

  <button type="submit">Calculate</button>
</form>
</body>
</html>
