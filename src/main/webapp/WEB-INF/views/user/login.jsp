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

<form method="post" cssClass="container col-6" >


    <input type="text" name="login" placeholder="login">
    <c:if test="${errorLogin}">
        Wrong password
    </c:if>
    <input type="password" placeholder="haslo" name="password">
    <c:if test="${errorPassword}">
        Wrong password
    </c:if>

    <input type="submit"  class="btn btn-success">
</form>

</body>
</html>