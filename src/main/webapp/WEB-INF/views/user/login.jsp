<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.2.1/solar/bootstrap.min.css" rel="stylesheet" integrity="sha384-eEgFc00/DZ7ZxynbWKmCPG4M//a5puGMS+QpGal8QYF56ApHqwXSuDOZ4PbVF1L6" crossorigin="anonymous">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="http://localhost:8080/home">HOME</a>
    </nav>
</head>
<body>
<form method="post">
    <fieldset>
<div class="form-group">
<label>Login</label>
<input type="text" class="form-control" name="login" aria-describedby="loginHelp" placeholder="Login">
</div>
        <c:if test="${e}">
            No user with such login
        </c:if>
<div class="form-group">
    <label>Password</label>
    <input type="password" class="form-control" name="password" placeholder="Password">
</div>
        <c:if test="${errorPassword}">
            Wrong password
        </c:if>
        <button type="submit" class="btn btn-secondary">Submit</button>
    </fieldset>
</form>



<%@include file="/WEB-INF/views/footer.jsp"%>