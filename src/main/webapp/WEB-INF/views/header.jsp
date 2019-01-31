<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.2.1/solar/bootstrap.min.css" rel="stylesheet" integrity="sha384-eEgFc00/DZ7ZxynbWKmCPG4M//a5puGMS+QpGal8QYF56ApHqwXSuDOZ4PbVF1L6" crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="http://localhost:8080/home">HOME</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav mr-auto">
                        <c:if test="${user != null}">

                                <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/user/edit">Edit Profile</a>
                                </li>
                                <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/recipe/save">Add new Recipe</a>
                                </li>
                                <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/user/profile">Profile</a>
                                </li>
                                <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/user/logout">Log Out</a>
                                </li>

                                <c:if test="${!user.admin}">
                                        <li class="nav-item">
                                                <a class="nav-link" href="http://localhost:8080/style/save">Propose Beer Style !</a>
                                        </li>
                                </c:if>
                        </c:if>

                        <c:if test="${user.admin}">

                                <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/user/admin">Admin panel</a>
                                </li>

                        </c:if>

                        <c:if test="${user == null}">
                                <a class="btn btn-secondary my-2 my-sm-0"  href="http://localhost:8080/user/login">Log In</a>
                                <a class="btn btn-secondary my-2 my-sm-0" href="http://localhost:8080/user/save">Register</a>
                                <p></p
                        </c:if>
                </ul>

        </div>
</nav>
</head>

