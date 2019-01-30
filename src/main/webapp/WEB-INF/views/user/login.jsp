<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

<form method="post" cssClass="container col-6" >

    <input type="text" name="login" placeholder="login">
    <c:if test="${e}">
        Wrong password
    </c:if>
    <input type="password" placeholder="haslo" name="password">
    <c:if test="${errorPassword}">
        Wrong password
    </c:if>

    <input type="submit"  class="btn btn-success">
</form>

<%@include file="/WEB-INF/views/footer.jsp"%>