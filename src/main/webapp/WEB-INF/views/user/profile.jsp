
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

        <th scope="col">id</th>
        <th scope="col">created</th>
        <th scope="col">login</th>
        <th scope="col">name</th>
        <th scope="col">surname</th>
        <th scope="col">email</th>
        <th scope="col">about</th>
        <th scope="col">brewery Name</th>
        <th scope="col">equipment</th>
        <th scope="col">delete User</th>
    </tr>
    </thead>

    <tr>
        <tr class="table-default">
        <td>${user.id}</td>
        <td>${user.created}</td>
        <td>${user.login}</td>
        <td>${user.name}</td>
        <td>${user.surname}</td>
        <td>${user.email}</td>
        <td>${user.about}</td>
        <td>${user.breweryName}</td>
        <td>${user.equipment}</td>
        <td><a class="btn btn-dark" href="http://localhost:8080/user/delete">Delete</a></td>
    </tr>
</table>


<c:if test="${noRecipes}">
<div class="text"><p> You have no recipes yet</p></div>
</c:if>

<c:if test="${noRecipes ==false}">

<ul class="list-view">

    <c:forEach items="${recipes}" var="recipe">

        <li>
            Date : ${recipe.dateTime} Title: ${recipe.recipeName}
                <a href="http://localhost:8080/recipe/${recipe.getId()}">Show Recipe Details</a><br>
                <a href="http://localhost:8080/recipe/edit/${recipe.getId()}">Edit Recipe</a>

        </li>
    </c:forEach>
</ul>
</c:if>




<%@include file="/WEB-INF/views/footer.jsp"%>
