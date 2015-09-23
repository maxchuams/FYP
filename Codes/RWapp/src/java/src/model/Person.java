/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

/**
 *
 * @author admin
 */
public class Person {

    private String type;
    private String username;
    private String password;


    public Person(String username, String password, String type) {
        this.username = username;
        this.password = password;
        this.type = type;
       
    }
    
    public void setPassword(String password){
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getType() {
        return type;
    }

}
