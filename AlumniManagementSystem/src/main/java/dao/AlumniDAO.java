package dao;

import java.sql.*;
import model.Alumni;

public class AlumniDAO {

    // 🔹 REGISTER
    public static int register(Alumni a) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO alumni(name,email,password,course,year) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, a.getName());
            ps.setString(2, a.getEmail());
            ps.setString(3, a.getPassword());
            ps.setString(4, a.getCourse());
            ps.setInt(5, a.getYear());

            status = ps.executeUpdate();

            System.out.println("Inserted rows: " + status);

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 🔹 LOGIN
    public static boolean login(String email, String password) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM alumni WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 🔹 GET PROFILE (THIS WAS MISSING ❗)
    public static Alumni getProfile(String email) {
        Alumni a = null;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM alumni WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Alumni();
                a.setName(rs.getString("name"));
                a.setEmail(rs.getString("email"));
                a.setCourse(rs.getString("course"));
                a.setYear(rs.getInt("year"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return a;
    }
    public static java.util.List<String> getUpdates() {
        java.util.List<String> list = new java.util.ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM updates ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String data = rs.getString("email") + " : " + rs.getString("content");
                list.add(data);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}