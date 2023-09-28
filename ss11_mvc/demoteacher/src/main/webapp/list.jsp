<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 28/09/2023
  Time: 10:00 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List</title>
</head>
<body>
<a href="/student-servlet?action=create">Thêm mới học viên</a>
<table border="1px">
  <thead>
  <tr>
    <th>STT</th>
    <th>Tên ($)</th>
    <th>Tên (c)</th>
    <th>Giới tính</th>
    <th>Điểm</th>
    <th>Xếp loại</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${studentList}" var="student" varStatus="loop">
    <tr>
      <td>${loop.count}</td>
      <td>${student.name}</td>
      <td><c:out value="${student.name}"/></td>

        <%--Gender--%>
      <c:if test="${student.gender == true}">
        <td>Nam</td>
      </c:if>
      <c:if test="${student.gender == false}">
        <td>Nữ</td>
      </c:if>

        <%--Xếp loại--%>
      <td>${student.point}</td>
      <c:choose>
        <c:when test="${student.point > 8}">
          <td>Giỏi</td>
        </c:when>
        <c:when test="${student.point > 6}">
          <td>Khá</td>
        </c:when>
        <c:when test="${student.point > 4}">
          <td>Trung bình</td>
        </c:when>
        <c:otherwise>
          <td>Yếu</td>
        </c:otherwise>
      </c:choose>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
