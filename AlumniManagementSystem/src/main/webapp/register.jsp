<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>
body {
    font-family: Arial;
    background: #f0f4f8;
}

.form-box {
    width: 400px;
    margin: 60px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
}

input {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
}

button {
    width: 100%;
    padding: 10px;
    background: green;
    color: white;
    border: none;
}

a {
    display: block;
    text-align: center;
    margin-top: 10px;
}
</style>

</head>
<body>

<div class="form-box">
    <h2>Register</h2>

    <%
    String msg = request.getParameter("msg");
    if("error".equals(msg)){
    %>
        <p style="color:red;text-align:center;">Registration failed</p>
    <%
    }
    %>

    <form action="RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="text" name="course" placeholder="Course" required>
        <input type="number" name="year" placeholder="Year" required>

        <button type="submit">Register</button>
    </form>

    <a href="login.jsp">Already have an account? Login</a>
</div>

</body>
</html>