<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>my demo jstl</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div style="text-align: center">
            <h1>Danh sách khách hàng</h1>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Tên</th>
                <th scope="col">Ngày Sinh</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Ảnh</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCustomer}" var="customer" varStatus="loop">
                <tr scope="row">
                    <td>${loop.count}</td>
                    <td>${customer.name}</td>
                    <td>${customer.birthday}</td>
                    <td>${customer.address}</td>
                    <td><img src="${customer.img}" style="width: 50px; height: 50px" alt="anh"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>