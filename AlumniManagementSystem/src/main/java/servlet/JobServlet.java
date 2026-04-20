package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.JobDAO;

@WebServlet("/PostJobServlet")
public class JobServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = (String) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String desc = request.getParameter("description");

        int status = JobDAO.postJob(email, title, desc);

        if (status > 0) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.getWriter().println("Job Post Failed");
        }
    }
}