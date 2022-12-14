<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>

<body class="container container-fluid mt-5">

<div class="container container-fluid bg-light mt-md-5">
    <h3 align="center">Add Resident</h3>
    <form action="/" method="POST">
        <input type="hidden" name="command" value="ADD"/>

        <div class="form-group col-md-3">
            <label for="inputFirstName">First Name</label>
            <input type="text" class="form-control" name="firstName" id="inputFirstName">
        </div>

        <div class="form-group col-md-3">
            <label for="inputLastName">Last Name</label>
            <input type="text" class="form-control" name="lastName" id="inputLastName">
        </div>

        <div class="form-group col-md-2">
            <label for="inputAddress">Address: </label>
            <input type="text" class="form-control" name="address" id="inputAddress">
        </div>

        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="inputTown">Town</label>
                <input type="text" class="form-control" name="town" id="inputTown">
            </div>

            <div class="form-group col-md-2">
                <label for="inputProvince">Province</label>
                <input type="text" class="form-control" name="province" id="inputProvince">
            </div>

            <div class="form-group col-md-2">
                <label for="inputCountry">Country</label>
                <input type="text" class="form-control" name="country" id="inputCountry">
            </div>
        </div>
        <div class="d-lg-inline">
            <input type="submit" name="Save" class="btn btn-secondary"/>
            <a href="/">Back to List</a>
        </div>
    </form>
</div>
</div>
</body>

<%@ include file="footer.html" %>

</html>