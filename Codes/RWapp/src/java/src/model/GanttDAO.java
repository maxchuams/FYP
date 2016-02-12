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
 * @author calvin
 */
public class GanttDAO {
    
    public static ArrayList<Gnatt> retrieveGnatt(String name) {
        System.out.println(name);
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Gnatt> fuck = new ArrayList<Gnatt>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("SELECT projectallocation.projectname,developerusername,planstart,planend FROM projectallocation left join project on projectallocation.projectname = project.projectname and project.iscomplete = 0 and project.assignby = 'kaiwen12'");
           // pstmt.setString(1, name);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Gnatt gnatt = null;
                gnatt = new Gnatt(rs.getString(1), rs.getString(2), rs.getTimestamp(3), rs.getTimestamp(4));
                fuck.add(gnatt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return fuck;

    }
    
    public static ArrayList<String> retrieveDeveloper() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> fuck = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select username from user where type = 'c'");
            //pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String gnatt = rs.getString(1);
                fuck.add(gnatt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return fuck;

    }
    
}
