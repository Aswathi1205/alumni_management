package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import model.Alumni;
import dao.AlumniDAO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Alumni a = new Alumni();
        a.setName(request.getParameter("name"));
        a.setEmail(request.getParameter("email"));
        a.setPassword(request.getParameter("password"));
        a.setCourse(request.getParameter("course"));
        a.setYear(Integer.parseInt(request.getParameter("year")));

        int status = AlumniDAO.register(a);

        System.out.println("Status = " + status);

        if (status > 0) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration Failed");
        }
    }
}