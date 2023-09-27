<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 27/9/2023
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/student-servlet?action=create" method="post">
    ID: <input type="text" name="id"><br>
    Name: <input type="text" name="name"><br>
    Gender: <input type="radio" name="gender" value="male"> Nam
    <input type="radio" name="gender" value="female"> Nữ<br>
    Point: <input type="number" name="point">
    <input type="submit" value="Create">
</form>
</body>
</html>
