<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/09/2023
  Time: 10:02 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>create</title>
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
