
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
</head>
<body>

<c:if test="${user.id == recipe.getUser().getId()}">

<form:form method="post"
           action="/recipe/save"
           modelAttribute="recipe"
           cssClass="container col-6" >


    <form:hidden path="id" />
    <form:hidden path="dateTime"/>

    <form:textarea path="materials" cols="100" rows="5" placeholder="materials" cssClass="form-input" /><br>
    <form:errors path="materials" cssClass="alet alert-danger" element="div"/>

    <form:textarea path="process" cols="100" rows="5" placeholder="process" cssClass="form-input" /><br>
    <form:errors path="process" cssClass="alet alert-danger" element="div"/>

    <form:input path="recipeName" placeholder="recipeName" cssClass="form-input" /><br>
    <form:errors path="recipeName" cssClass="alet alert-danger" element="div"/>

    <form:select path="style">
        <form:option value="0" disabled="true" selected="true" label="wybierz styl"/>
        <form:options  items="${styles}" itemValue="id" itemLabel="beerStyle"/>

    </form:select><br>

    <form:hidden path="user" value="${user.getId()}"/>


    <input type="submit"  class="btn btn-success">

</form:form>
</c:if>
<c:if test="${user.id != recipe.getUser().getId()}">
    <h1>You Cant Edit Other Users Recipes ! You tricky bastardooooooooo !! Juz się chciało przyjanuszyć co ?<h1>
</c:if>

<%@include file="/WEB-INF/views/footer.jsp"%>