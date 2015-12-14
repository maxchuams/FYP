/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.OutputStream;


/**
 *
 * @author KIANLAM
 */
public abstract class FileService{


 public static void exportBuffer(byte[] buffer,OutputStream out){

     ByteArrayInputStream input = null;  
     BufferedOutputStream output = null;  
     int contentLength = 0;

     try{

       input = new ByteArrayInputStream(buffer); 
       contentLength = input.available();

       output = new BufferedOutputStream(out);
 
       while ( contentLength-- > 0 ) {
           output.write(input.read());
       }
            
       output.flush();    

     }catch(Exception exp){
     }finally{

         try{

            if(input != null)
              input.close();
           
            if(output != null)
              output.close();  
         }catch(Exception ep){
         }   

     }   


  } 

}