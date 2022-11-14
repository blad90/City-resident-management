<%@ page import="java.util.*" %>
<%@ page import="com.bladbaez.web.db.ResidentDbUtil" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.bladbaez.web.domain.Resident" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>City-resident Management App</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>
    <div>
        <h2>City Residents</h2>
    </div>

    <div>
        <input type="button" value="Add Resident"
        onclick="window.location.href='add-resident-form.jsp'; return false;"/>

        <table border="1">
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
                <!-- set up a link for each resident -->
                <tr>
                    <td>${tempResident.getId()}</td>
                    <td>${tempResident.getName()}</td>
                    <td>${tempResident.getLastName()}</td>
                    <td>${tempResident.getDateOfBirth()}</td>
                    <td>${tempResident.getTown()}</td>
                    <td>${tempResident.getProvince()}</td>
                    <td>${tempResident.getCountry()}</td>
                </tr>

            </c:forEach>

        </table>
    </div>
</body>

</html>