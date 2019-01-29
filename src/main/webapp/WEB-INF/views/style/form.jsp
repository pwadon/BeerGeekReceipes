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

<c:if test="${user.admin == false}">
    User
<form:form method="post"
           action=""
           modelAttribute="style"
           cssClass="container col-6" >

    <form:hidden path="id" />

    <form:input path="beerStyle" placeholder="beerStyle" cssClass="form-input" />
    <form:errors path="beerStyle" cssClass="alet alert-danger" element="div"/>

    <c:if test="${styleError}">
        Taki styl juz istnieje
    </c:if>
    <form:hidden path="styleProposition"/>

    <input type="submit"  class="btn btn-success">
</form:form>
</c:if>


<c:if test="${user.admin}">
    User
    <form:form method="post"
               action=""
               modelAttribute="style"
               cssClass="container col-6" >

        <form:hidden path="id" />

        <form:input path="beerStyle" placeholder="beerStyle" cssClass="form-input" />
        <form:errors path="beerStyle" cssClass="alet alert-danger" element="div"/>
        <c:if test="${styleError}">
            Taki styl juz istnieje
        </c:if>
      Zaznacz jeżeli akceptujesz  <form:checkbox path="styleProposition"/>

        <input type="submit"  class="btn btn-success">
    </form:form>
</c:if>
</body>
</html>