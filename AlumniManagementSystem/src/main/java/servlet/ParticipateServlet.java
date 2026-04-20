package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.EventDAO;

@WebServlet("/ParticipateServlet")
public class ParticipateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get existing session (DO NOT create new one)
        HttpSession session = request.getSession(false);

        // ❌ If session not found → redirect to login
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ Get logged-in user
        String email = (String) session.getAttribute("user");

        // ❌ If user not found → redirect
        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ Get event ID from form
        String idStr = request.getParameter("eventId");

        if (idStr == null || idStr.isEmpty()) {
            response.getWriter().println("Error: Event ID missing");
            return;
        }

        int eventId = Integer.parseInt(idStr);

        // ✅ Insert into DB
        int status = EventDAO.participate(email, eventId);

        System.out.println("Participate status = " + status);

        // ✅ Redirect back
        response.sendRedirect("dashboard.jsp");
    }
}