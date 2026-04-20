<%@ page import="model.Alumni,dao.AlumniDAO" %>

<%
String email = (String) session.getAttribute("user");

if (email == null) {
    response.sendRedirect("login.jsp");
    return;   // ✅ MUST ADD THIS
}

Alumni a = AlumniDAO.getProfile(email);

if (a == null) {
%>
    <h3 style="color:red;text-align:center;">Profile not found</h3>
<%
    return;   // ✅ STOP EXECUTION
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<style>
body {
    font-family: Arial;
    background: #f0f4f8;
    text-align: center;
}

.card {
    background: white;
    width: 400px;
    margin: 100px auto;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
}
</style>

</head>
<body>

<div class="card">
    <h2>My Profile</h2>

    <p><b>Name:</b> <%= a.getName() %></p>
    <p><b>Email:</b> <%= a.getEmail() %></p>
    <p><b>Course:</b> <%= a.getCourse() %></p>
    <p><b>Year:</b> <%= a.getYear() %></p>

    <br>
    <a href="dashboard.jsp">⬅ Back to Dashboard</a>
</div>

</body>
</html>