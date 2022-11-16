<%@ page import="java.util.*" %>
<%@ page import="com.bladbaez.web.db.ResidentDbUtil" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.bladbaez.web.model.Resident" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>City Residents Management App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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

<body class="container container-fluid mt-2">

<div class="container container-fluid bg-light mt-md-5">
    <h3 align="center">Update Resident</h3>
    <form action="ResidentControllerServlet" method="GET">
        <input type="hidden" name="command" value="UPDATE"/>
        <input type="hidden" name="residentId" value=${THE_RESIDENT.id}>

        <div class="form-group col-md-2">
            <label for="inputID">ID</label>
            <input type="text" class="form-control" name="id" id="inputID" value="${THE_RESIDENT.id}" readonly>
        </div>

        <div class="form-group col-md-6">
        <label for="inputFirstName">First Name</label>
        <input type="text" class="form-control" name="firstName" id="inputFirstName" value="${THE_RESIDENT.firstName}">
        </div>

        <div class="form-group col-md-6">
        <label for="inputLastName">Last Name</label>
        <input type="text" class="form-control" name="lastName" id="inputLastName" value="${THE_RESIDENT.lastName}">
        </div>

        <%--                <tr>--%>
        <%--                    <td><label>Date of Birth: </label></td>--%>
        <%--                    <td><input type="text" name="dateOfBirth" value="${THE_RESIDENT.dateOfBirth}"></td>--%>
        <%--                </tr>--%>
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="inputTown">Town</label>
                <input type="text" class="form-control" name="town" id="inputTown" value="${THE_RESIDENT.town}">
            </div>

            <div class="form-group col-md-2">
                <label for="inputProvince">Province</label>
                <input type="text" class="form-control" name="province" id="inputProvince" value="${THE_RESIDENT.province}">
            </div>

            <div class="form-group col-md-2">
                <label for="inputCountry">Country</label>
                <input type="text" class="form-control" name="country" id="inputCountry" value="${THE_RESIDENT.country}">
            </div>
        </div>
        <div>
        <input type="submit" value="Update" class="btn btn-secondary">
        </div>
    </form>
</div>
<div style="clear:both;">
    <p>
        <a href="ResidentServlet">Back to List</a>
    </p>
</div>
</body>

<footer>&copy;2022 - City Residents Management App</footer>

</html>