<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

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

/* CENTER WRAPPER */
.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 90vh;
}

/* REGISTER BOX */
.register-box {
    width: 400px;
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
    margin-bottom: 12px;
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

/* MESSAGE */
.message {
    padding: 10px;
    margin-bottom: 15px;
    text-align: center;
    border-radius: 5px;
}

.error {
    background: #f8d7da;
    color: #721c24;
}

/* LINK */
.link {
    text-align: center;
    margin-top: 15px;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Alumni Portal</h2>
</div>

<div class="wrapper">

    <div class="register-box">

        <h2>Create Account</h2>

        <%
        String msg = request.getParameter("msg");
        if("error".equals(msg)){
        %>
            <div class="message error">
                Registration failed. Try again.
            </div>
        <%
        }
        %>

        <form action="RegisterServlet" method="post">
            <input type="text" name="name" placeholder="Enter your name" required>
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter password" required>
            <input type="text" name="course" placeholder="Course" required>
            <input type="number" name="year" placeholder="Year" required>

            <button type="submit">Register</button>
        </form>

        <div class="link">
            <a href="login.jsp">Already have an account? Login</a>
        </div>

    </div>

</div>

</body>
</html>
