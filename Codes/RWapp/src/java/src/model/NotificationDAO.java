/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kesmeen Tan
 */
public class NotificationDAO {

    /**
     *Add a new notification to database
     * @param username the username of the person
     * @param notificationtype the type of notification
     * @param projectname project name related to this notification
     * @return boolean of whether or not it was a successful addition
     */

    public boolean addNotification(String username, String notificationtype, String projectname) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("insert into notifications(username, notificationtype, projectname, status, dateandtime, archived) values (?,?,?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, notificationtype);
            ps.setString(3, projectname);
            ps.setString(4, "F");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            ps.setString(5, dateFormat.format(date));
            ps.setString(6, "F");

            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            ConnectionManager.close(conn, ps, rs);

        }

    }
    
    /**
     *Mark a notification as read
     * @param id the unique identifier for the notification
     * @return boolean of whether or not it was a successful operation
     */

    public boolean checkAsRead(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("update notifications set status = 'T' where notificationid = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, ps);
        }
        return true;

    }

    /**
     *Mark a notification as unread
     * @param id the unique identifier for the notification
     * @return boolean of whether or not it was a successful operation
     */
     
    public boolean checkAsUnread(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("update notifications set status = 'F' where notificationid = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, ps);
        }
        return true;

    }

    /**
     * Retrieves a full list of notification for a specific user that are unread
     * @param username the username of the person
     * @param limit value Yes to limit the notifications shown on the bar
     * @param period the period you want to retrieve the notifications from   
     * @return list of notification for specific user  
     */
    public ArrayList<Notification> retrieveAllFromUser(String username, String limit, String period) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Notification> allNotifs = new ArrayList<Notification>();

        try {
            if (limit.equals("Yes")) {
                conn = ConnectionManager.getConnection();
                ps = conn.prepareStatement("select * from notifications where username = '" + username + "' and archived = 'F' order by dateandtime desc limit 3");
                rs = ps.executeQuery();
            } else if (period.equals("today")) {
                conn = ConnectionManager.getConnection();
                ps = conn.prepareStatement("select * from notifications where username = '" + username + "' and dateandtime > date_add(curdate(), interval -1 day) and archived = 'F' order by dateandtime desc");
                rs = ps.executeQuery();
            } else if (period.equals("yesterday")) {
                conn = ConnectionManager.getConnection();
                ps = conn.prepareStatement("select * from notifications where username = '" + username + "' and dateandtime <= date_add(curdate(), interval -1 day) and dateandtime > date_add(curdate(), interval -2 day) and archived = 'F' order by dateandtime desc");
                rs = ps.executeQuery();
            } else if (period.equals("lastweek")) {
                conn = ConnectionManager.getConnection();
                ps = conn.prepareStatement("select * from notifications where username = '" + username + "' and dateandtime <= date_add(curdate(), interval -2 day) and dateandtime > date_add(curdate(), interval -7 day) and archived = 'F' order by dateandtime desc");
                rs = ps.executeQuery();
            } else if (period.equals("alongtimeago")){
                conn = ConnectionManager.getConnection();
                ps = conn.prepareStatement("select * from notifications where username = '" + username + "' and dateandtime <= date_add(curdate(), interval -7 day) and archived = 'F' order by dateandtime desc");
                rs = ps.executeQuery();
            }
            while (rs.next()) {
                allNotifs.add(new Notification(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }

        return allNotifs;

    }
    
    /**
     * Retrieves a specific notification
     * @param id the unique identifier for the notification
     * @return Notification object with the id
     */

    public Notification retrieveNotification(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Notification notif = null;

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from notifications where notificationid =" + id);
            rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("hi");
                notif = new Notification(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException ex) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        System.out.println(notif);
        return notif;
    }
    
    /**
     *Archive a notification so it will not show up in notifications anymore
     * @param id the unique identifier for the notification
     * @return boolean of whether or not it was a successful operation
     */
     
    public boolean archive(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("update notifications set archived = 'T' where notificationid = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, ps);
        }
        return true;
    }
    
    /**
     *Unarchive a notification so it will show up in notifications 
     * @param id the unique identifier for the notification
     * @return boolean of whether or not it was a successful operation
     */
     
    public boolean unarchive(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("update notifications set archived = 'F' where notificationid = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, ps);
        }
        return true;
    }
    /**
     * Retrieves a full list of notification for a specific user, both read and unread
     * @param username the username of the person   
     * @return full list of notifications from user
     */
    public ArrayList<Notification> retrieveAllArchivedFromUser(String username) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Notification> allNotifs = new ArrayList<Notification>();

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from notifications where username = '" + username + "' and archived = 'T' order by dateandtime desc");
            rs = ps.executeQuery();

            while (rs.next()) {
                allNotifs.add(new Notification(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }

        return allNotifs;

    }

}
