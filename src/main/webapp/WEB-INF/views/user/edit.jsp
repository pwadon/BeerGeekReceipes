<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Edit User</title>
</head>
<body>

<form:form method="post"
           modelAttribute="user"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="login" placeholder="login"  cssClass="form-input" />
    <form:errors path="login" cssClass="alet alert-danger" element="div"/>
    <c:if test="${usererror}">
        User already Exists
    </c:if>

    <form:input path="email" placeholder="email"  cssClass="form-input"/>
    <form:errors path="email" cssClass="alet alert-danger" element="div"/>
    <c:if test="${emailError}">
        This email is already in use !
    </c:if>
    <form:password path="password" placeholder="password" value="${user.password}" cssClass="form-input"/>
    <form:errors path="password" cssClass="alet alert-danger" element="div"/>

    <input type="password" placeholder="powtorz haslo" value="${user.password}" name="rp">
    <c:if test="${error}">
        Wrong password
    </c:if>

    <form:checkbox path="emailPrivate" />
    <form:hidden path="admin"/>
    <form:hidden path="enabled"/>

    <form:input path="name" placeholder="name"  cssClass="form-input" />
    <form:errors path="name" cssClass="alet alert-danger" element="div"/>

    <form:input path="surname" placeholder="surname"  cssClass="form-input" />
    <form:errors path="surname" cssClass="alet alert-danger" element="div"/>

    <form:textarea path="about" placeholder="about"  cssClass="form-input" />
    <form:errors path="about" cssClass="alet alert-danger" element="div"/>

    <form:textarea path="equipment" placeholder="equipment"  cssClass="form-input" />
    <form:errors path="equipment" cssClass="alet alert-danger" element="div"/>

    <form:input path="breweryName" placeholder="breweryName"  cssClass="form-input" />
    <form:errors path="breweryName" cssClass="alet alert-danger" element="div"/>


    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>
