/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author KIANLAM
 */
public class DefectScreenshotDAO {

    /**
     *Gets the screenshot
     * @param defectid id of the defect 
     * @param updatetime time at which screenshot was added
     * @return Image
     */
    public static ImageDTOBean getScreenshot(String defectid, String updatetime) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ImageDTOBean screenshot = new ImageDTOBean();
        Date utime = null;
        String queryStr = null;

        Timestamp tstamp = new Timestamp(0);
        try {

            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("select defectid, updatetime, photo from defectscreenshot where defectid=? and updatetime=?");
            pstmt.setString(1, defectid);
            pstmt.setTimestamp(2, tstamp.valueOf(updatetime));
            rs = pstmt.executeQuery();

            Blob blob = null;
            byte[] imageBuffer = null;

            while (rs.next()) {

                screenshot = new ImageDTOBean();
                screenshot.setImageName("Defectid_" + rs.getString("defectid") + "_" + rs.getString("updatetime"));
                screenshot.setImageContentType("image/jpeg");
                imageBuffer = rs.getBytes("photo");

                screenshot.setImageBuffer(imageBuffer);
            }

            blob = null;
            imageBuffer = null;

        } catch (Exception exp) {

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (Exception ep) {
            } finally {
                conn = null;
                pstmt = null;
                rs = null;
            }
        }

        return screenshot;
    }

    /**
     *Get time at which screenshot was added
     * @param defectid ths id of the defect
     * @return the ArrayList of String that screenshot was updated at
     */
    public static ArrayList<String> getScreenshotTimestamp(String defectid) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String queryStr = null;
        String utime = null;
        ArrayList<String> timestamps = new ArrayList<String>();

        try {

            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("select updatetime from defectscreenshot where defectid=?");
            pstmt.setString(1, defectid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                utime = rs.getString("updatetime");
                timestamps.add(utime);
            }

        } catch (Exception exp) {
            //blah
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (Exception ep) {
            } finally {
                conn = null;
                pstmt = null;
                rs = null;
            }
        }

        return timestamps;
    }
}
