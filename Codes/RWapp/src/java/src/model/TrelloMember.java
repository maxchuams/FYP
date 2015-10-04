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
public class TrelloMember {
    private String id;

    public TrelloMember(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }
    
    public String toString(){
        return id;
    }
}
