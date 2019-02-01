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

<form:form method="post"
           action="/style/edit"
           modelAttribute="style"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="beerStyle" placeholder="beerStyle" cssClass="form-input" />
    <form:errors path="beerStyle" cssClass="alet alert-danger" element="div"/>
    <c:if test="${styleError}">
        Taki styl juz istnieje
    </c:if>
    <c:if test="${styleError == false}">
        Zedytowano styl
    </c:if>

    <c:if test="${style.styleProposition}">
    <form:hidden path="styleProposition" value ="true"/>
    </c:if>

    <c:if test="${!style.styleProposition}">
    <form:hidden path="styleProposition" value ="true"/>
        <a class="" href="http://localhost:8080/style/delete/${style.getId()}">Delete Style</a>
    </c:if>

    <input type="submit"  class="btn btn-success">
</form:form>

<%@include file="/WEB-INF/views/footer.jsp"%>