
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
<%@include file="/WEB-INF/views/header.jsp"%>
</head>
<body class="p-3 mb-2 bg-info text-white">

<table class="table table-stripped">
    <tr>
        <th>id</th>
        <th>created</th>
        <th>login</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>email - private</th>
        <th>about</th>
        <th>brewery Name</th>
        <th>equipment</th>
        <th>delete User</th>


    </tr>
    <tr>
        <td>${user.id}</td>
        <td>${user.created}</td>
        <td>${user.login}</td>
        <td>${user.name}</td>
        <td>${user.surname}</td>
        <td>${user.email}</td>
        <td>${user.emailPrivate}</td>
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
            Date : ${recipe.dateTime} Title: ${recipe.recipeName} User nick : ${recipe.getUser().getLogin()}
                <a href="http://localhost:8080/recipe/${recipe.getId()}">Show Recipe</a>

        </li>
    </c:forEach>
</ul>
</c:if>




<%@include file="/WEB-INF/views/footer.jsp"%>
