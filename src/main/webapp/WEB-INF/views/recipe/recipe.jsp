<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tweet</title>
    <%@include file="/WEB-INF/views/header.jsp"%>>
    <style>
        input, select{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
</head>
<body class="p-3 mb-2 bg-info">
<a href="http://localhost:8080/home">HOME</a><br>

Recipe id : ${recipe.getId()}
Date : ${recipe.dateTime}
Title: ${recipe.recipeName}
User nick : ${recipe.getUser().getLogin()}<br>
materials : ${recipe.materials}<br>
process : ${recipe.process}<br>

<table class="table table-stripped">
<tr>
    <th>id</th>
    <th>created</th>
    <th>text</th>
    <th>login</th>
</tr>
<c:forEach items="${recipe.getComments()}" var="comment">
    <tr>
    <td>${comment.id}</td>
    <td>${comment.created}</td>
    <td>${comment.text}</td>
    <td>${comment.getUser().getLogin()}</td>
    </tr>
</c:forEach>
</table>

<c:if test="${user != null}">

    <form:form method="post"
               action="/recipe/${recipe.getId()}/comment"
               modelAttribute="comment"
               cssClass="container col-6" >
        <form:hidden path="id"/>

        <form:input path="text" placeholder="text" cssClass="form-input"/>
        <form:errors path="text" cssClass="alert alert-danger" element="div"/>

        <form:hidden path="created"/>

        <form:hidden path="recipe" value="${recipe.getId()}"/>
        <form:hidden path="user" value="${user.getId()}"/>

        <input type="submit" class="btn btn-success">

    </form:form>

</c:if>
<%@include file="/WEB-INF/views/footer.jsp"%>