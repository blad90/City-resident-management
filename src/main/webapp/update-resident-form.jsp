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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<header class="card card-header align-items-center">
    <h2>City Residents</h2>
</header>

<body class="container container-fluid">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">App</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse border-1" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/list-residents.jsp">List</a>
            </li>
        </ul>
    </div>
</nav>
</div>

<h3>Update Resident</h3>
    <form class="container container-fluid" action="ResidentControllerServlet" method="GET">
        <input type="hidden" name="command" value="UPDATE" />
        <input type="hidden" name="residentId" value=${THE_RESIDENT.id}>

        <table>
            <tbody>
                <tr>
                    <td><label>First Name: </label></td>
                    <td><input type="text" name="firstName" value="${THE_RESIDENT.firstName}"></td>
                </tr>

                <tr>
                    <td><label>Last Name: </label></td>
                    <td><input type="text" name="lastName" value="${THE_RESIDENT.lastName}"></td>
                </tr>

<%--                <tr>--%>
<%--                    <td><label>Date of Birth: </label></td>--%>
<%--                    <td><input type="text" name="dateOfBirth" value="${THE_RESIDENT.dateOfBirth}"></td>--%>
<%--                </tr>--%>

                <tr>
                    <td><label>Town: </label></td>
                    <td><input type="text" name="town" value="${THE_RESIDENT.town}"></td>
                </tr>

                <tr>
                    <td><label>Province: </label></td>
                    <td><input type="text" name="province" value="${THE_RESIDENT.province}"></td>
                </tr>
                <tr>
                    <td><label>Country: </label></td>
                    <td><input type="text" name="country" value="${THE_RESIDENT.country}"></td>
                </tr>

            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" >
                </td>
            </tr>
            </tbody>
        </table>
    </form>
<div style="clear:both;">
    <p>
        <a href="ResidentServlet">Back to List</a>
    </p>
</div>
</body>

<footer>&copy;2022 - City Residents Management App</footer>

</html>