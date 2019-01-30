<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>

</head>
<body>
    <h1>Home Page</h1>

    <a href="http://localhost:8080/user/save">register</a>
    <a href="http://localhost:8080/user/login">login</a>
    <a href="http://localhost:8080/user/edit">edit</a>
    <a href="http://localhost:8080/user/delete">delete</a>
    <a href="http://localhost:8080/style/save">style Save</a>
    <a href="http://localhost:8080/recipe/save">recipe Save</a>

User: ${user.login}

<c:if test="${not empty user}">
    WELCOME ${user.login}
</c:if>

    <ul>
        <c:forEach items="${recipes}" var="recipe">
            <li>
                <h4>Date : ${recipe.dateTime} Title: ${recipe.recipeName} User nick : ${recipe.getUser().getLogin()}
                    <a href="http://localhost:8080/recipe/${recipe.getId()}">Show Recipe</a>
                    <br> Text : ${recipe.process} </h4>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
