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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class TrelloDetailsDAO {
    
    public static String retrieveTrelloKey(String username){
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       
        String toReturn = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select trellokey from user where username like ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                
                toReturn = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectionManager.close(conn, pstmt, rs); 
        }
        return toReturn;
     
    }
    public static String retrieveTrelloToken(String username){
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       
        String toReturn = null;
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select token from user where username like ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                
                toReturn = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectionManager.close(conn, pstmt, rs); 
        }
        return toReturn;
     
    }
    
}
