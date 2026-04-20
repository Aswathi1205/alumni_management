package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/PostUpdateServlet")
public class PostUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String email = (String) request.getSession().getAttribute("user");
        String content = request.getParameter("content");

        int status = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO updates(email, content) VALUES(?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, content);

            status = ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("dashboard.jsp");
    }
}