<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/09/2023
  Time: 8:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<div class="container">
  <form action="/servlet-product?action=find" method="post">
    <label for="find">Nhập tên sản phẩm cần tìm</label>
    <input type="text" name="find" id="find">
    <input type="submit" value="Tìm">
  </form>
  <table class="table table-success table-striped">
    <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Tên</th>
      <th scope="col">giá</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Nhà sản xuất</th>
      <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="product" varStatus="loop">
      <tr>
        <th scope="row">${loop.count}</th>
        <td>${product.name}</td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.producer}</td>
        <td>
          <button type="button" class="btn btn-primary"><a style="color: white" href="/servlet-product?action=edit&id=${product.id}">Sửa</a></button>
          <button type="button" class="btn btn-primary"><a style="color: white" href="/servlet-product?action=delete&id=${product.id}">Xóa</a></button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<button type="button" class="btn btn-primary"><a style="color: white" href="/servlet-product?action=create">Thêm</a></button>
</body>
</html>
