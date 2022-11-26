<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>

<body class="container container-fluid mt-2">
<div class="container container-fluid bg-light mt-md-5">
    <h3 align="center">Update Resident</h3>
    <form action="/" method="GET">
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

        <div class="form-group col-md-2">
            <label for="inputAddress">Address: </label>
            <input type="text" class="form-control" name="address" id="inputAddress" value="${THE_RESIDENT.address}">
        </div>

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

<%@ include file="footer.html" %>

</html>