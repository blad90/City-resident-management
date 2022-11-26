<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<body class="container container-fluid mt-2">
<div class="container-fluid mt-md-5">
    <div class="container-lg">
        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>ADDRESS</th>
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
                    <td><c:out value="${tempResident.getAddress()}"/></td>
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

</div>
<%@ include file="footer.html" %>
</html>