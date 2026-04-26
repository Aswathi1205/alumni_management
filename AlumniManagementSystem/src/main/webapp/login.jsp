<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
}
.navbar h2 {
    margin: 0;
}

/* CENTER CONTAINER */
.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 85vh;
}

/* LOGIN BOX */
.login-box {
    width: 380px;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
}

/* TITLE */
h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* INPUT */
input {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 15px;
}

/* BUTTON */
button {
    width: 100%;
    background: #3498db;
    color: white;
    border: none;
    padding: 12px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
}
button:hover {
    background: #2980b9;
}

/* LINKS */
.link {
    text-align: center;
    margin-top: 15px;
}

/* MESSAGES */
.message {
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 15px;
    text-align: center;
    font-size: 14px;
}

.success {
    background: #d4edda;
    color: #155724;
}

.error {
    background: #f8d7da;
    color: #721c24;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Alumni Portal</h2>
</div>

<div class="wrapper">

    <div class="login-box">

        <h2>Login</h2>

        <!-- SUCCESS MESSAGE -->
        <%
        String msg = request.getParameter("msg");
        if("success".equals(msg)){
        %>
            <div class="message success">
                Registration Successful! Please login.
            </div>
        <%
        }
        %>

        <!-- ERROR MESSAGE -->
        <%
        String error = request.getParameter("error");
        if("invalid".equals(error)){
        %>
            <div class="message error">
                Invalid email or password
            </div>
        <%
        }
        %>

        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Login</button>
        </form>

        <div class="link">
            <a href="register.jsp">New user? Register</a>
        </div>

    </div>

</div>

</body>
</html>
