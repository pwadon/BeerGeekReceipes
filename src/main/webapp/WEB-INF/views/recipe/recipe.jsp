<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tweet</title>
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
<a href="http://localhost:8080/home">HOME</a><br>

Recipe id : ${recipe.getId()}
Date : ${recipe.dateTime}
Title: ${recipe.recipeName}
User nick : ${recipe.getUser().getLogin()}
materials : ${recipe.materials}<br>
process : ${recipe.process}


<c:forEach items="${recipe.getComments()}" var="comment">
    comment : ${comment.getText()} date : ${comment.getCreated()} author : ${comment.getUser().getLogin()}<br>
</c:forEach>

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
</body>
</html>