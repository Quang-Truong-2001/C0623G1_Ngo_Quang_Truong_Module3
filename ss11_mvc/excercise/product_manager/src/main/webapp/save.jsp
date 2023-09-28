<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/09/2023
  Time: 11:11 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Save</title>
</head>
<body>
<h1>Thêm sản phẩm</h1>
<form action="/servlet?action=save" method="post">
  <label for="name">Nhập tên</label>
  <input type="text" name="name" id="name">
  <br>
  <label for="price">Nhập giá</label>
  <input type="number" name="price" id="price">
  <br>
  <label for="description">Nhập mô tả</label>
  <input type="text" name="description" id="description">
  <br>
  <label for="producer">Nhập nhà sản xuất</label>
  <input type="text" name="producer" id="producer">
  <br>
  <input type="submit" value="save">
</form>
</body>
</html>
