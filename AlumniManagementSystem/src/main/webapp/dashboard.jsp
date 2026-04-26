<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,dao.AlumniDAO,dao.JobDAO,dao.EventDAO" %>

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
    align-items: center;
}
.navbar h2 {
    margin: 0;
}
.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    font-size: 15px;
}

/* MAIN CONTAINER */
.container {
    width: 80%;
    margin: 40px auto;
}

/* SECTION */
.section {
    background: white;
    padding: 25px;
    margin-bottom: 25px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

/* TEXT */
h2, h3 {
    margin-bottom: 15px;
}
p {
    font-size: 16px;
}

/* INPUT */
input {
    width: 60%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 15px;
}

/* BUTTON */
button {
    background: #3498db;
    color: white;
    border: none;
    padding: 10px 16px;
    border-radius: 5px;
    cursor: pointer;
}
button:hover {
    background: #2980b9;
}

/* LIST BOX */
.item {
    background: #eef2f7;
    padding: 12px;
    border-radius: 6px;
    margin-bottom: 10px;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Alumni Portal</h2>
    <div>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="profile.jsp">Profile</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

    <!-- WELCOME -->
    <div class="section">
        <h2>Welcome, <%= user %> </h2>
        <p>You are logged in successfully.</p>
    </div>

    <!-- POST UPDATE -->
    <div class="section">
        <h3>Post Update</h3>

        <form action="PostUpdateServlet" method="post">
            <input type="text" name="content" placeholder="Share update..." required>
            <br>
            <button type="submit">Post</button>
        </form>
    </div>

    <!-- UPDATES -->
    <div class="section">
        <h3>Updates</h3>

        <%
        List<String> updates = AlumniDAO.getUpdates();
        for(String u : updates){
        %>
            <div class="item">
                <%= u %>
            </div>
        <%
        }
        %>
    </div>

    <!-- JOB POST -->
    <div class="section">
        <h3>Post Job</h3>

        <form action="PostJobServlet" method="post">
            <input type="text" name="title" placeholder="Job Title" required><br>
            <input type="text" name="description" placeholder="Job Description" required><br>
            <button type="submit">Post Job</button>
        </form>
    </div>

    <!-- JOB LIST -->
    <div class="section">
        <h3>Job Opportunities</h3>

        <%
        List<String> jobs = JobDAO.getJobs();
        for(String j : jobs){
        %>
            <div class="item">
                <%= j %>
            </div>
        <%
        }
        %>
    </div>

    <!-- EVENTS -->
    <div class="section">
        <h3>Events</h3>

        <%
        List<String[]> events = EventDAO.getEvents();
        for(String[] e : events){
        %>
            <div class="item">
                <b><%= e[1] %></b><br>
                <%= e[2] %><br>
                Date: <%= e[3] %>

                <form action="ParticipateServlet" method="post" style="margin-top:10px;">
                    <input type="hidden" name="eventId" value="<%= e[0] %>">
                    <button type="submit">Participate</button>
                </form>
            </div>
        <%
        }
        %>
    </div>

</div>

</body>
</html>
