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
 * @author admin
 */
public class TrelloCardDAO {

    public static boolean addCard(TrelloCard tc) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("insert into project (projectname, trellokey, description, duedate, priority, type) values (?, ?, ? ,?, ?,?)");
            pstmt.setString(1, tc.getName());
            pstmt.setString(2, tc.getId());
            pstmt.setString(3, tc.getDesc());
            pstmt.setString(4, tc.getDue());
            pstmt.setInt(5, tc.getPriority());
            pstmt.setString(6, tc.getType());
            pstmt.executeUpdate();
            System.out.println("Trello card : " + tc);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }

    public static void clearData() {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("truncate project");
           
            pstmt.executeUpdate();

           
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }

    }
    public static boolean updatePriority(String projectName, String priority){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //System.out.println(projectName);
        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("update project set priority=? where projectname=?");
            
            pstmt.setString(1, priority);
            pstmt.setString(2, projectName);
         
            pstmt.executeUpdate();
            //System.out.println("Trello card : " + tc);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            ConnectionManager.close(conn, pstmt, rs);

        }
    }
    public static ArrayList<TrelloCard> retrieveAll(){
          ArrayList<TrelloCard> cards = new ArrayList<TrelloCard>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement("select * from project");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                if(rs.getString(3)!=null){
                    cards.add(new TrelloCard(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getInt(5), rs.getString(6)));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }
        return cards;
    }
    
            
}
