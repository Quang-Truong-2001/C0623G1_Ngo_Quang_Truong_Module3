<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/09/2023
  Time: 10:43 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<h1>Danh sách sản phẩm tìm kiếm</h1>
<div class="container">
  <table class="table table-success table-striped">
    <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Tên</th>
      <th scope="col">giá</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Nhà sản xuất</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${find}" var="product" varStatus="loop">
      <tr>
        <th scope="row">${loop.count}</th>
        <td>${product.name}</td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.producer}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
