<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 26/09/2023
  Time: 11:10 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/servlet">
    <label for="num1">Số thứ 1:</label>
    <input type="number" name="number1" id="num1">
    <br>
    <label for="num2">Số thứ 2:</label>
    <input type="number" name="number2" id="num2">
    <input type="submit" value="Tổng">
</form>
Kết quả: ${result}
</body>
</html>
