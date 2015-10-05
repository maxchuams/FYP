/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author admin
 */
public class TrelloBoard {
    private String name;
    private String id;
    private ArrayList<TrelloMember> mList;

    public TrelloBoard(String name, String id, ArrayList<TrelloMember> mList) {
        this.name = name;
        this.id = id;
        this.mList = mList;
    }

    public TrelloBoard(String name, String id) {
        this.name = name;
        this.id = id;
    }

    
    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setmList(ArrayList<TrelloMember> mList) {
        this.mList = mList;
    }

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public ArrayList<TrelloMember> getmList() {
        return mList;
    }
    
    public String toString(){
       
        return "Name : " + name + " Board ID : " + id;
    }
}
