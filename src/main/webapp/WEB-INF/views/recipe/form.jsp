<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Recipe</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
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

    <form:textarea rows="15" cols="40" path="materials" placeholder="materials" cssClass="form-input" />
    <form:errors path="materials" cssClass="alet alert-danger" element="div"/>

    <form:textarea rows="15" cols="40" path="process" placeholder="process" cssClass="form-input" />
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


<%@include file="/WEB-INF/views/footer.jsp"%>