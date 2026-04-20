<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #74ebd5, #9face6);
}

.form-box {
    width: 350px;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 10px;
    background: #1976d2;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
}

button:hover {
    background: #0d47a1;
}

a {
    display: block;
    text-align: center;
    margin-top: 10px;
    text-decoration: none;
}

.message {
    text-align: center;
    margin-bottom: 10px;
}
.success {
    color: green;
}
.error {
    color: red;
}
</style>

</head>
<body>

<div class="form-box">

    <h2>Login</h2>

    <!-- SUCCESS MESSAGE -->
    <%
    String msg = request.getParameter("msg");
    if("success".equals(msg)){
    %>
        <div class="message success">Registration Successful! Please login.</div>
    <%
    }
    %>

    <!-- ERROR MESSAGE -->
    <%
    String error = request.getParameter("error");
    if("invalid".equals(error)){
    %>
        <div class="message error">Invalid email or password</div>
    <%
    }
    %>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <a href="register.jsp">Don't have an account? Register</a>

</div>

</body>
</html>