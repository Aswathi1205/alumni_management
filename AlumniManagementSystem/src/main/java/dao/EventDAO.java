package dao;

import java.sql.*;
import java.util.*;

public class EventDAO {

    // ADD EVENT (for now simple)
    public static int addEvent(String title, String desc, String date) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO events(title,description,date) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setString(3, date);

            status = ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // GET EVENTS
    public static List<String[]> getEvents() {
        List<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM events ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] e = new String[4];
                e[0] = rs.getString("id");
                e[1] = rs.getString("title");
                e[2] = rs.getString("description");
                e[3] = rs.getString("date");

                list.add(e);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // PARTICIPATE
    public static int participate(String email, int eventId) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO participation(email,event_id) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setInt(2, eventId);

            status = ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}