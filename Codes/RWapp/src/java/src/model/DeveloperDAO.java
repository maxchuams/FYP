/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maxchua
 */
public class DeveloperDAO {

    /**
     *Add a new Developer to the Database
     * @param p the Developer Object to add
     * @return true or false depending if the method was successful
     */
    public static boolean addDeveloper(Developer p) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into developer (username, employmentdate, nationality) values (?,?,?)");
            pstmt.setString(1, p.getUsername());
            pstmt.setString(2, p.getEmploymentDate());
            pstmt.setString(3, p.getNationality());
            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

    }

    /**
     *Get all developers
     * @return ArrayList of Developer objects
     */
    public static ArrayList<Developer> retrieveDevelopers() {
        ArrayList<Developer> developers = new ArrayList<Developer>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("select d.username as username,password,type,trellokey,trellotoken, employmentdate, nationality from user u, developer d where u.username=d.username");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                developers.add(new Developer(
                        new Person(rs.getString("username"), rs.getString("password"), rs.getString("type"), rs.getString("trellokey"), rs.getString("trellotoken")), rs.getString("employmentdate"), rs.getString("nationality")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }
        return developers;
    }

    /**
     *Get nationality of Developer
     * @param username the username of the developer
     * @return the country
     */
    public static String retrieveDevCountry(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String toReturn = "";
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select nationality from developer where username like ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //String username, String password,String type, String trellokey, String trellotoken, String employmentDate, String nationality
                //DAO username, employment date nationality
                toReturn = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
    }

    /**
     *Update the country of a developer
     * @param country the new country of the developer
     * @param username the developer to change
     * @return true or false depending if the method was successful
     */
    public static boolean updateCountry(String country, String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("UPDATE developer set nationality = ? where username=?");
            pstmt.setString(1, country);
            pstmt.setString(2, username);
            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }
}
