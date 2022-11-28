<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>City-resident Management App</title>
  <link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png" type="image/x-icon" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<header>
  <!--  <div class="container"><h1 class="display-3 ">City Residents</h1></div>-->
  <img src="<c:url value="/img/city-residents-logo.png" />" width="130" height="70" alt="etc"/>

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
</html>