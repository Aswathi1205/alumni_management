package dao;

import java.sql.*;
import java.util.*;

public class JobDAO {

    // POST JOB
    public static int postJob(String email, String title, String desc) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO jobs(email,title,description) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, title);
            ps.setString(3, desc);

            status = ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // GET JOBS
    public static List<String> getJobs() {
        List<String> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM jobs ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String job = rs.getString("email") + " | "
                        + rs.getString("title") + " : "
                        + rs.getString("description");

                list.add(job);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}