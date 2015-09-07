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
    private String name;
    private String username;
    private String password;
    private int yearsWorked;

    public Person(String name, String username, String password, int yearsWorked) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.yearsWorked = yearsWorked;
    }

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getYearsWorked() {
        return yearsWorked;
    }
    
}
