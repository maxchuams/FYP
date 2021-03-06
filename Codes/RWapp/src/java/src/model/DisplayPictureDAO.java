/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

/**
 *
 * @author KIANLAM
 */
import java.sql.Blob;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class DisplayPictureDAO {

    static ArrayList<Person> plist;

    /**
     *Get the Image
     * @param imageName the name of the image
     * @return Image
     */
    public static ImageDTOBean getImageData(String imageName) {

        ImageDTOBean idto = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("select username, photo from user where username=?");
            pstmt.setString(1, imageName);

            rs = pstmt.executeQuery();

            Blob blob = null;
            byte[] imageBuffer = null;

            while (rs.next()) {

                idto = new ImageDTOBean();
                idto.setImageName(rs.getString("username"));
                idto.setImageContentType("image/jpeg");
                //idto.setImageContentType(rs.getString("Content_Type"));
                imageBuffer = rs.getBytes("photo");

                /* or try with
                 blob = rs.getBlob("image");
                 imageBuffer = blob.getBytes(1,blob.length());                 
                 */
                idto.setImageBuffer(imageBuffer);
            }

            blob = null;
            imageBuffer = null;

        } catch (Exception exp) {

            //LoggingUtils.logException(exp,"Expection in getImageData("+ imageName+")");
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

                //LoggingUtils.logException(ep,"Expection in getImageData("+ imageName+")");
            } finally {
                conn = null;
                pstmt = null;
                rs = null;
            }

        }

        return idto;
    }

}
