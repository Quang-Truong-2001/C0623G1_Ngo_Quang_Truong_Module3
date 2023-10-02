<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 29/09/2023
  Time: 11:26 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <div class="container">
      <form action="/servlet-user?action=update" method="post">
          <input type="hidden" name="id" value="${id}">
        <div class="mb-3">
          <label for="name" class="form-label">Name</label>
          <input type="text" class="form-control" name="name" id="name" value="${user.name}">
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="text" class="form-control" name="email" id="email" value="${user.email}">
        </div>
        <div class="mb-3">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="country" id="country" value="${user.country}">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
</body>
</html>
