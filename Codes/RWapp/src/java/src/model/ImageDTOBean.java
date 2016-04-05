/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.sql.Blob;

/**
 *
 * @author KIANLAM
 */
public class ImageDTOBean {

    private byte[] imageBuffer;
    private String imageName;
    private String imageContentType;

    /**
     *
     * @return Image buffer
     */
    public byte[] getImageBuffer() {
        return imageBuffer;
    }

    /**
     *
     * @param imageBuffer
     */
    public void setImageBuffer(byte[] imageBuffer) {
        this.imageBuffer = imageBuffer;
    }

    /**
     *
     * @return the name of the image
     */
    public String getImageName() {
        return imageName;
    }

    /**
     *
     * @param imageName the name of the image
     */
    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    /**
     *
     * @return content type of the image
     */
    public String getImageContentType() {
        return imageContentType;
    }

    /**
     *
     * @param imageContentType the content type of the image
     */
    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

}
