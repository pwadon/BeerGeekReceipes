
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <%@include file="/WEB-INF/views/header.jsp"%>
    <style>
        input, select{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
</head>
<body class="p-3 mb-2 bg-info">

<form:form method="post"
           modelAttribute="user"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="login" placeholder="login"  cssClass="form-input" />
    <form:errors path="login" cssClass="alet alert-danger" element="div"/>
    <c:if test="${userError}">
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
    <c:if test="${pwdError}">
        Wrong password
    </c:if>

    <form:checkbox path="emailPrivate" label="Do you want your mail to be private ?" />
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


<%@include file="/WEB-INF/views/footer.jsp"%>
