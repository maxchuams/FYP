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
    private String trelloKey;
    private String token;

    public Person( String username, String password,String type, String trelloKey, String token) {
        this.type = type;
        this.username = username;
        this.password = password;
        this.trelloKey = trelloKey;
        this.token = token;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTrelloKey(String trelloKey) {
        this.trelloKey = trelloKey;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setPassword(String password) {
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

    public String getTrelloKey() {
        return trelloKey;
    }

    public String getToken() {
        return token;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Person{" + "type=" + type + ", username=" + username + ", password=" + password + ", trelloKey=" + trelloKey + ", token=" + token + '}';
    }
    
}
