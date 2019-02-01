<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.2.1/solar/bootstrap.min.css" rel="stylesheet" integrity="sha384-eEgFc00/DZ7ZxynbWKmCPG4M//a5puGMS+QpGal8QYF56ApHqwXSuDOZ4PbVF1L6" crossorigin="anonymous">

    <style>
        input, select{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
</head>
<body>

<form:form method="post"
           action="${formAction}"
           modelAttribute="user"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="login" placeholder="login" cssClass="form-input" />
    <form:errors path="login" cssClass="alet alert-danger" element="div"/>
    <c:if test="${userError}">
        <div class="alet alert-danger">User already Exists</div>
    </c:if>

    <form:input path="email" placeholder="email" cssClass="form-input"/>
    <form:errors path="email" cssClass="alet alert-danger" element="div"/>
    <c:if test="${emailError}">
        This email is already in use !
    </c:if>
    <form:password path="password" placeholder="password" cssClass="form-input"/>
    <form:errors path="password" cssClass="alet alert-danger" element="div"/>

    <input type="password" placeholder="powtorz haslo" name="rp">
    <c:if test="${pwdError}">
        Wrong password
    </c:if>

    <form:hidden path="emailPrivate"/>
    <form:hidden path="admin"/>
    <form:hidden path="enabled"/>





    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>