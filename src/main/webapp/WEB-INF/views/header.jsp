
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<div class="p-3 mb-2 bg-dark text-white">
<c:if test="${user != null}">
        <p class="text-right">Welcome, ${user.login}</p>
        <a class="btn btn-info float-right" href="http://localhost:8080/user/logOut">Log OUT</a>
        <p></p>
        <a class="btn btn-info" href="http://localhost:8080/home/home">Home Page</a>
        <a class="btn btn-info" href="http://localhost:8080/user/recipe/list">My Recipes</a>
        <a class="btn btn-info" href="http://localhost:8080/user/list">Edit profile</a>
        <a class="btn btn-info" href="http://localhost:8080/recipe/save">Add new Recipe</a>
        <a class="btn btn-info" href="http://localhost:8080/user/profile">Your profile</a>
</c:if>

    <c:if test="${user == null}">
        <a class="btn btn-info float-right" href="http://localhost:8080/user/login">Log In</a>
        <a class="btn btn-info float-right" href="http://localhost:8080/user/save">Log In</a>
        <p></p>
    </c:if>

</div>
</head>
