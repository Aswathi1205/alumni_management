<%@ page import="model.Alumni,dao.AlumniDAO" %>

<%
String email = (String) session.getAttribute("user");

if (email == null) {
    response.sendRedirect("login.jsp");
    return;
}

Alumni a = AlumniDAO.getProfile(email);

if (a == null) {
%>
    <h3 style="color:red;text-align:center;">Profile not found</h3>
<%
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<style>
body {
    margin: 0;
    font-family: "Segoe UI", Arial;
    background: #f4f6f9;
}

/* NAVBAR */
.navbar {
    background: #2c3e50;
    color: white;
    padding: 15px 40px;
    display: flex;
    justify-content: space-between;
}
.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
}

/* CONTAINER */
.container {
    width: 80%;
    margin: 40px auto;
}

/* PROFILE SECTION */
.profile-box {
    background: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

/* TITLE */
h2 {
    margin-bottom: 20px;
}

/* PROFILE ROW */
.row {
    margin-bottom: 15px;
    font-size: 16px;
}

.label {
    font-weight: bold;
    color: #333;
}

.value {
    margin-left: 10px;
    color: #555;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Profile</h2>
    <div>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

    <div class="profile-box">

        <h2>My Profile</h2>

        <div class="row">
            <span class="label">Name:</span>
            <span class="value"><%= a.getName() %></span>
        </div>

        <div class="row">
            <span class="label">Email:</span>
            <span class="value"><%= a.getEmail() %></span>
        </div>

        <div class="row">
            <span class="label">Course:</span>
            <span class="value"><%= a.getCourse() %></span>
        </div>

        <div class="row">
            <span class="label">Year:</span>
            <span class="value"><%= a.getYear() %></span>
        </div>

    </div>

</div>

</body>
</html>
