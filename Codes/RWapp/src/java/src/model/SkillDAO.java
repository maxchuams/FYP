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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class SkillDAO {
    
    public static ArrayList<String> retrieveDevSkillString(String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;

        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select skill from developerskill where username like ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectionManager.close(conn,pstmt,rs);
            return toReturn;
        }
        

    }
    
    public static ArrayList<Skill> retrieveDevSkill(String username) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;

        ArrayList<Skill> toReturn = new ArrayList<Skill>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select username,skill from developerskill where username like ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Skill toAdd = new Skill(rs.getString(1), rs.getString(2));
                toReturn.add(toAdd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectionManager.close(conn,pstmt,rs);
            return toReturn;
        }
        

    }
    
    public static ArrayList<String> retrieveAllSkill() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList<String> toReturn = new ArrayList<String>();
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select distinct skill from developerskill");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                toReturn.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectionManager.close(conn,pstmt,rs);
            return toReturn;
        }
        

    }
    
     public static boolean addDevSkill(String username, String skill) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Person user = null;

        
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into developerskill (username, skill) values (?, ?)");
            pstmt.setString(1, username);
            pstmt.setString(2, skill);
            pstmt.executeUpdate();

           return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }finally{
            
            ConnectionManager.close(conn,pstmt,rs);
            
            
        }
        

    }
     public static boolean deleteSkill(String username, String skill){
         Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionManager.getConnection();

            String sql = "DELETE FROM developerskill where "
                    + "username=?   and skill =?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, username);
            pstmt.setString(2, skill);
            

            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, pstmt);
        }
     }

}
