<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
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
           action=""
           modelAttribute="recipe"
           cssClass="container col-6" >

    <form:hidden path="id" />
    <form:hidden path="dateTime"/>

    <form:input path="materials" placeholder="materials" cssClass="form-input" />
    <form:errors path="materials" cssClass="alet alert-danger" element="div"/>

    <form:input path="process" placeholder="process" cssClass="form-input" />
    <form:errors path="process" cssClass="alet alert-danger" element="div"/>

    <form:input path="recipeName" placeholder="recipeName" cssClass="form-input" />
    <form:errors path="recipeName" cssClass="alet alert-danger" element="div"/>

    <form:select path="style">

        <form:options  items="${styles}" itemValue="id" itemLabel="beerStyle"/>

    </form:select>
    <form:errors path="style" cssClass="alet alert-danger" element="div"/>
    <form:hidden path="user" value="${user.getId()}"/>

    <input type="submit"  class="btn btn-success">
</form:form>




</body>
</html>