<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,dao.AlumniDAO" %>

<%
String user = (String) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
body {
    font-family: Arial;
    background: #f5f5f5;
    text-align: center;
}

.container {
    margin-top: 50px;
}

.card {
    background: white;
    padding: 30px;
    width: 400px;
    margin: auto;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
}

input {
    width: 90%;
    padding: 8px;
    margin: 10px 0;
}

button {
    padding: 8px 15px;
    background: blue;
    color: white;
    border: none;
}

.update-box {
    background: #fff;
    padding: 10px;
    margin: 10px;
    border-radius: 5px;
    box-shadow: 0px 0px 5px gray;
}
</style>

</head>
<body>

<div class="container">

    <div class="card">
        <h2>Welcome, <%= user %> </h2>
        <p>You are logged in successfully.</p>

        <a href="LogoutServlet">Logout</a>
    </div>

    <br>
    <a href="profile.jsp">View Profile</a>
    <br>

    <!-- POST UPDATE -->
    <div class="card">
        <h3>Post Update</h3>

        <form action="PostUpdateServlet" method="post">
            <input type="text" name="content" placeholder="Share update..." required>
            <br>
            <button type="submit">Post</button>
        </form>
    </div>

    <br>

    <!-- VIEW UPDATES -->
    <div class="card">
        <h3>Updates</h3>

        <%
        List<String> updates = AlumniDAO.getUpdates();

        for(String u : updates){
        %>
            <div class="update-box">
                <%= u %>
            </div>
        <%
        }
        %>
    </div>
    <h3>Post Job</h3>

<form action="PostJobServlet" method="post">
    <input type="text" name="title" placeholder="Job Title" required><br>
    <input type="text" name="description" placeholder="Job Description" required><br>
    <button type="submit">Post Job</button>
</form>

<h3>Job Opportunities</h3>

<%@ page import="dao.JobDAO" %>

<%
List<String> jobs = JobDAO.getJobs();

for(String j : jobs){
%>
    <div class="update-box">
        <%= j %>
    </div>
<%
}
%>
<h3>Events</h3>

<%@ page import="dao.EventDAO" %>

<%
List<String[]> events = EventDAO.getEvents();

for(String[] e : events){
%>
    <div class="update-box">
        <b><%= e[1] %></b><br>
        <%= e[2] %><br>
        Date: <%= e[3] %>

        <form action="ParticipateServlet" method="post">
            <input type="hidden" name="eventId" value="<%= e[0] %>">
            <button type="submit">Participate</button>
        </form>
    </div>
<%
}
%>

</div>

</body>
</html>