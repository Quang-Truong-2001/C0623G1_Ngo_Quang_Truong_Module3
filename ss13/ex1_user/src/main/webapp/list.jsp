<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 29/09/2023
  Time: 11:09 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<div class="container">
  <h1>Danh sách người dùng</h1>
  <form action="/servlet-user?action=find" method="post">
    <div class="mb-3">
      <label for="country" class="form-label">Country</label>
      <input type="text" class="form-control" name="country" id="country">
    </div>
    <button type="submit" class="btn btn-primary">Tìm</button>
  </form>
  <table class="table">
    <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Country</th>
      <th scope="col">Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="user" varStatus="loop">
      <tr>
        <th scope="row">${loop.count}</th>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
        <td><button type="button" class="btn btn-info"><a style="color: white" href="/servlet-user?action=update&id=${user.id}">Sửa</a></button></td>
        <td><button type="button" class="btn btn-info"><a style="color: white" href="/servlet-user?action=delete&id=${user.id}">Xóa</a></button></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <button type="button" class="btn btn-info"><a style="color: white" href="/servlet-user?action=save">Thêm</a></button>
</div>
</body>
</html>
