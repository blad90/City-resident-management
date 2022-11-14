<!DOCTYPE html>

<html>
<head>
    <title>Add Resident</title>
</head>

<body>
<div>
    <h3>City-resident Management App</h3>
</div>

<div>
    <h4>Add Resident</h4>
    <form action="ResidentControllerServlet" method="POST">
        <input type="hidden" name="command" value="ADD" />
        <table>
            <tbody>
            <tr>
                <td><label>First name:</label></td>
                <td><input type="text" name="firstName"/></td>
            </tr>

            <tr>
                <td><label>Last name:</label></td>
                <td><input type="text" name="lastName"/></td>
            </tr>

            <tr>
                <td><label>Date of Birth:</label></td>
                <td><input type="text" name="dateOfBirth"/></td>
            </tr>

            <tr>
                <td><label>Town:</label></td>
                <td><input type="text" name="town"/></td>
            </tr>

            <tr>
                <td><label>Province:</label></td>
                <td><input type="text" name="province"/></td>
            </tr>

            <tr>
                <td><label>Country:</label></td>
                <td><input type="text" name="country"/></td>
            </tr>

            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" class="save"/></td>
            </tr>
            </tbody>
        </table>
    </form>

    <div>
        <p>
            <a href="ResidentControllerServlet">Back to List</a>
        </p>
    </div>

</div>

</body>

</html>