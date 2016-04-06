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

    /**
     *Create a new Person object
     * @param username the username of the person
     * @param password the password of the person
     * @param type the type of the person
     * @param trelloKey trello key
     * @param token trello token
     */
    public Person( String username, String password,String type, String trelloKey, String token) {
        this.type = type;
        this.username = username;
        this.password = password;
        this.trelloKey = trelloKey;
        this.token = token;
    }

    /**
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     *
     * @param trelloKey
     */
    public void setTrelloKey(String trelloKey) {
        this.trelloKey = trelloKey;
    }

    /**
     *
     * @param token
     */
    public void setToken(String token) {
        this.token = token;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     * @return
     */
    public String getUsername() {
        return username;
    }

    /**
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     * @return
     */
    public String getType() {
        return type;
    }

    /**
     *
     * @return
     */
    public String getTrelloKey() {
        return trelloKey;
    }

    /**
     *
     * @return
     */
    public String getToken() {
        return token;
    }

    /**
     *
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Person{" + "type=" + type + ", username=" + username + ", password=" + password + ", trelloKey=" + trelloKey + ", token=" + token + '}';
    }
    
}
