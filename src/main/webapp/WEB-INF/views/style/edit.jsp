<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Edit User</title>
</head>
<body>

<form:form method="post"
           action="/style/save"
           modelAttribute="style"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="beerStyle" placeholder="beerStyle" cssClass="form-input" />
    <form:errors path="beerStyle" cssClass="alet alert-danger" element="div"/>



    <form:hidden path="styleProposition"/>


    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>
