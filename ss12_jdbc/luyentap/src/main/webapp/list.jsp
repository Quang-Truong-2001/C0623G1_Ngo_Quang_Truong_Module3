<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<div class="container">
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
                <td><button type="button" class="btn btn-info"><a href="/servlet?action=edit&id=${user.id}">EDIT</a></button></td>
                <td><button type="button" class="btn btn-info"><a href="/servlet?action=delete&id=${user.id}">DELETE</a></button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button type="button" class="btn btn-info"><a href="/servlet?action=save">ADD</a></button>
</div>
</body>
</html>