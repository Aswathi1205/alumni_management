package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.AlumniDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean status = AlumniDAO.login(email, password);

        System.out.println("Login status = " + status);

        if (status) {
            HttpSession session = request.getSession();
            session.setAttribute("user", email);

            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}

