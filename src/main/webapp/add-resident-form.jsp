<!DOCTYPE html>

<html>
<head>
    <title>Add Resident</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>

    <h3 class="card card-header align-items-center">City Residents</h3>

<body class="align-items-center">
<div class="container container-fluid">


    <h4>Add Resident</h4>
<div>
    <form action="/" method="POST">
        <input type="hidden" name="command" value="ADD" />
        <table>
            <tbody>
            <tr>
                <td><label>ID:</label></td>
                <td><input type="hidden" name="id"/></td>
            </tr>

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
                <td><input type="date" name="dateOfBirth"/></td>
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
                <td>
                    <button type="submit" class="btn btn-secondary">Save</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
    <div>
        <p>
            <a href="/">Back to List</a>
        </p>
    </div>
</div>
</body>

</html>