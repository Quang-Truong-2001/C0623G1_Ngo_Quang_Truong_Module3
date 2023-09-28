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
<h1>Cập nhật thông tin sản phẩm</h1>
<div class="container">
  <form action="/servlet?action=edit" method="post">
    <input type="hidden" name="id" value="${product.id}">
    <div class="mb-3">
      <label for="name" class="form-label">Name</label>
      <input type="text" name="name" class="form-control" id="name" value="${product.name}">
    </div>
    <div class="mb-3">
      <label for="price" class="form-label">Price</label>
      <input type="number" name="price" class="form-control" id="price" value="${product.price}">
    </div>
    <div class="mb-3">
      <label for="description" class="form-label">Description</label>
      <input type="text" name="description" class="form-control" id="description" value="${product.description}">
    </div>
    <div class="mb-3">
      <label for="producer" class="form-label">producer</label>
      <input type="text" name="producer" class="form-control" id="producer" value="${product.producer}">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
</body>
</html>
