<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Edit User</title>
</head>
<body>

<form:form method="post"
           action="/recipe/save"
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
        <form:option value="0" disabled="true" selected="true" label="wybierz styl"/>
        <form:options  items="${styles}" itemValue="id" itemLabel="beerStyle"/>

    </form:select>

    <form:hidden path="user" value="${user.getId()}"/>


    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>
