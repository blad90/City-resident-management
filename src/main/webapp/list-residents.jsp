<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>City-resident Management App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<header>
    <div class="container"><h1 class="display-3 ">City Residents</h1></div>

    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navBarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/list-residents.jsp">List</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>

<section>

</section>

<body class="container container-fluid mt-2">
<div class="container-fluid mt-md-5">
    <div class="container-lg">
        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>DATE OF BIRTH</th>
                <th>TOWN</th>
                <th>PROVINCE</th>
                <th>COUNTRY</th>
                <th>ACTIONS</th>
            </tr>

            <c:forEach var="tempResident" items="${RESIDENT_LIST}">
                <c:url var="editLink" value="/">
                    <c:param name="command" value="LOAD"/>
                    <c:param name="residentId" value="${tempResident.id}"/>
                </c:url>

                <c:url var="deleteLink" value="/">
                    <c:param name="command" value="DELETE"/>
                    <c:param name="residentId" value="${tempResident.id}"/>
                </c:url>

                <tr>
                    <td><c:out value="${tempResident.id}"/></td>
                    <td><c:out value="${tempResident.getFirstName()}"/></td>
                    <td><c:out value="${tempResident.getLastName()}"/></td>
                    <td><c:out value="${tempResident.getDateOfBirth()}"/></td>
                    <td><c:out value="${tempResident.getTown()}"/></td>
                    <td><c:out value="${tempResident.getProvince()}"/></td>
                    <td><c:out value="${tempResident.getCountry()}"/></td>
                    <td>
                        <div class="btn btn-secondary"><a class="text-decoration-none text-white" href="${editLink}">EDIT</a></div>
                        <div class="btn btn-danger">
                            <a class="text-decoration-none text-white" href="${deleteLink}"
                            onclick="if(!(confirm('Confirm to delete this resident'))) return false">DELETE</a>
                        </div>
                    </td>
    </tr>
            </c:forEach>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</div>
</body>
<div align="center">
    <input class="btn btn-primary" value="ADD RESIDENT" type="submit"
           onclick="window.location.href='add-resident-form.jsp'; return false;"/>
    <footer>&copy;2022 - City Residents App</footer>
</div>
</html>