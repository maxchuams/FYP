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
public class Developer extends Person {

    private String employmentDate;
    private String nationality;

    /**
     *
     * @param username
     * @param password
     * @param type
     * @param trellokey
     * @param trellotoken
     * @param employmentDate
     * @param nationality
     */
    public Developer(String username, String password, String type, String trellokey, String trellotoken, String employmentDate, String nationality) {
        super(username, password, type, trellokey, trellotoken);
        this.employmentDate = employmentDate;
        this.nationality = nationality;
    }

    /**
     *Create new Developer object
     * @param p person object if there is inheritance
     * @param employmentDate the employment date of the developer
     * @param nationailty the nationality of the developer
     */
    public Developer(Person p, String employmentDate, String nationailty) {
        super(p.getUsername(), p.getPassword(), p.getType(), p.getTrelloKey(), p.getToken());
        this.employmentDate = employmentDate;
        this.nationality = nationality;
    }

    /**
     *
     * @return the Employment Date
     */
    public String getEmploymentDate() {
        return employmentDate;
    }

    /**
     *
     * @param employmentDate the employment date of the developer
     */
    public void setEmploymentDate(String employmentDate) {
        this.employmentDate = employmentDate;
    }

    /**
     *
     * @return the Nationality of the developer
     */
    public String getNationality() {
        return nationality;
    }

    /**
     *
     * @param nationality to set for the developer
     */
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

}
