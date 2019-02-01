
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.2.1/solar/bootstrap.min.css" rel="stylesheet" integrity="sha384-eEgFc00/DZ7ZxynbWKmCPG4M//a5puGMS+QpGal8QYF56ApHqwXSuDOZ4PbVF1L6" crossorigin="anonymous">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="http://localhost:8080/home">HOME</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <c:if test="${user != null}">

                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/user/edit">Edit Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/recipe/save">Add new Recipe</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/user/profile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/user/logout">Log Out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/user/delete">Delete User</a>
                    </li>

                </c:if>

                <c:if test="${user.admin}">

                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/user/profile">Admin panel</a>
                    </li>

                </c:if>

                <c:if test="${user == null}">
                    <a class="btn btn-secondary my-2 my-sm-0"  href="http://localhost:8080/user/login">Log In</a>
                    <a class="btn btn-secondary my-2 my-sm-0" href="http://localhost:8080/user/save">Register</a>
                    <p></p
                </c:if>
            </ul>

        </div>
    </nav>
</head>

</head>
<body>
<style>
    input, select{
        display: block;
        margin:15px 0;
        width: 100%;
    }
</style>

<form:form method="post"
           modelAttribute="user"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="login" placeholder="login"  cssClass="form-input" />
    <form:errors path="login" cssClass="alet alert-danger" element="div"/>
    <c:if test="${userError}">
        User already Exists
    </c:if>

    <form:input path="email" placeholder="email"  cssClass="form-input"/>
    <form:errors path="email" cssClass="alet alert-danger" element="div"/>
    <c:if test="${emailError}">
        This email is already in use !
    </c:if>
    <form:hidden path="password" placeholder="password" value="${user.password}" cssClass="form-input"/>




    <form:hidden path="admin"/>
    <form:hidden path="enabled"/>

    <form:input path="name" placeholder="name"  cssClass="form-input" />
    <form:errors path="name" cssClass="alet alert-danger" element="div"/>

    <form:input path="surname" placeholder="surname"  cssClass="form-input" />
    <form:errors path="surname" cssClass="alet alert-danger" element="div"/>

    <form:textarea path="about" placeholder="about" cols="50" rows="10"  cssClass="form-input" />
    <form:errors path="about" cssClass="alet alert-danger" element="div"/>

    <form:textarea path="equipment" placeholder="equipment" cols="50" rows="10"  cssClass="form-input" />
    <form:errors path="equipment" cssClass="alet alert-danger" element="div"/>

    <form:input path="breweryName" placeholder="breweryName"  cssClass="form-input" />
    <form:errors path="breweryName" cssClass="alet alert-danger" element="div"/>


    <input type="submit"  class="btn btn-success">
</form:form>


<%@include file="/WEB-INF/views/footer.jsp"%>
