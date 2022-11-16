<%@ page import="java.util.*" %>
<%@ page import="com.bladbaez.web.db.ResidentDbUtil" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.bladbaez.web.model.Resident" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>City-resident Management App</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<body class="container container-fluid">
    <div>
        <h2 class="card card-header align-items-center">City Residents</h2>


    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">App</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
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

    <div class="container-fluid">
        <table class="card table border-2" style="width:70%" align="center">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Date of Birth</th>
                <th>Town</th>
                <th>Province</th>
                <th>Country</th>
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
                        <a href="${editLink}">Edit</a>
                        <a href="${deleteLink}">Delete</a>
<%--                        <a href="${pageContext.request.contextPath}/ResidentControllerServlet?command=load&?id=<c:out value="${tempResident.id}" /> ">Edit</a>--%>
<%--                        <a href="${pageContext.request.contextPath}/ResidentControllerServlet?command=delete?id=<c:out value="${tempResident.id}" /> ">Delete</a>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>
<div align="center">
    <input value="Add Resident" type="submit" class="btn btn-primary "
           onclick="window.location.href='add-resident-form.jsp'; return false;"/>
    <footer>&copy;2022 - City Residents App</footer>
</div>



</html>