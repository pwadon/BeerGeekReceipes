<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <div class="p-3 mb-2 bg-dark text-white">
        <c:if test="${user != null}">
            <p class="text-right">Welcome, ${user.login}</p>
            <h3>BEER GEEKS RECIPES</h3>
            <a class="btn btn-info float-right" href="http://localhost:8080/user/logout">Log OUT</a>
            <p></p>
            <a class="btn btn-info" href="http://localhost:8080/user/edit">Edit profile</a>
            <a class="btn btn-info" href="http://localhost:8080/recipe/save">Add new Recipe</a>
            <a class="btn btn-info" href="http://localhost:8080/user/profile">Your profile</a>
            <c:if test="${user.admin}">
                <a class="btn btn-info" href="http://localhost:8080/user/profile">Admin panel</a>

            </c:if>
        </c:if>

        <c:if test="${user == null}">
            <a class="btn btn-info float-left" href="http://localhost:8080/user/login">LogIn</a>
            <a class="btn btn-info float-right" href="http://localhost:8080/user/save">Register</a>
            <p></p>
        </c:if>

    </div>
</head>


<body>
<div class="p-1 mb-3 bg-dark text-black">
    <ol class="chart-line-symbol text-black">
        <c:forEach items="${recipes}" var="recipe">
            <li class="list-group-item "> Date : ${recipe.dateTime}</li>
            <li class="list-group-item"> Title: ${recipe.recipeName}</li>
            <li class="list-group-item"> User nick : ${recipe.getUser().getLogin()}</li>
            <li class="list-group-item"> <a href="http://localhost:8080/recipe/${recipe.getId()}">Show Recipe</a></li>

        </c:forEach>
    </ol>
</div>
<%@include file="/WEB-INF/views/footer.jsp"%>
