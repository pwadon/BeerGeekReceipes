<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
</head>
<body>

<table class="table table-hover">
    <thead>
    <tr>

        <th scope="col">Add Style</th>
        <%--<th scope="col">Edit Style</th>--%>
        <%--<th scope="col">login</th>--%>
        <%--<th scope="col">name</th>--%>
        <%--<th scope="col">surname</th>--%>
        <%--<th scope="col">email</th>--%>
        <%--<th scope="col">about</th>--%>
        <%--<th scope="col">brewery Name</th>--%>
        <%--<th scope="col">equipment</th>--%>
        <%--<th scope="col">delete User</th>--%>
    </tr>
    </thead>

    <tr>
    <tr class="table-default">
        <td><a class="btn btn-dark" href="http://localhost:8080/style/save">Add New Style</a></td>
        <%--<td>${user.created}</td>--%>
        <%--<td>${user.login}</td>--%>
        <%--<td>${user.name}</td>--%>
        <%--<td>${user.surname}</td>--%>
        <%--<td>${user.email}</td>--%>
        <%--<td>${user.about}</td>--%>
        <%--<td>${user.breweryName}</td>--%>
        <%--<td>${user.equipment}</td>--%>
        <%--<td><a class="btn btn-dark" href="http://localhost:8080/user/delete">Delete</a></td>--%>
    </tr>
</table>


<c:if test="${empty styles}">
<div class="text"><p> There Are no styles yet</p></div>
</c:if>

<c:if test="${not empty styles}">

<ul class="list-view">

    <c:forEach items="${styles}" var="style">

        <li>
            id : ${style.id} Style: ${style.beerStyle}
            <a href="http://localhost:8080/style/edit/${style.getId()}">Edit Style</a>
            <c:if test="${!style.styleProposition}">
                Style need to be confirmed !
            </c:if>
        </li>
    </c:forEach>
</ul>
</c:if>




<%@include file="/WEB-INF/views/footer.jsp"%>
