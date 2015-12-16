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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maxchua
 */
public class ProjectDAO {
     public static ArrayList<Project> retrieveAll() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Project> toReturn = new ArrayList<Project>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize from project");
           
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Project(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getInt(6),rs.getInt(7), rs.getString(8),rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
     public static ArrayList<Project> retrieveInProgress(){
         Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Project> toReturn = new ArrayList<Project>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select projectname, trellokey, description, assignby, duedate, priority, iscomplete, type, psize from project where iscomplete = 0");
           
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(new Project(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getInt(6),rs.getInt(7), rs.getString(8),rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;
     }
     public static ArrayList<String> retrieveAllTypes() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct type from project");
           
            rs = pstmt.executeQuery();

            while (rs.next()) {

                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return toReturn;

    }
}
