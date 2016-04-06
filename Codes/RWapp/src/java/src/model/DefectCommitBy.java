/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

/**
 *
 * @author maxchua
 */
public class DefectCommitBy {

    private int id;
    private String username;

    /**
     *Create a new DefectCommitBy Object
     * @param id id of the defect
     * @param username username of the developer
     */
    public DefectCommitBy(int id, String username) {
        this.id = id;
        this.username = username;
    }

    /**
     *
     * @return the id of the defect
     */
    public int getId() {
        return id;
    }

    /**
     *Set the id of the project
     * @param id of the defect
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * @return the username of the developer
     */
    public String getUsername() {
        return username;
    }

    /**
     *
     * @param username username of the developer
     */
    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "DefectCommitBy{" + "id=" + id + ", username=" + username + '}';
    }

}
