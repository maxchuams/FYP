/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.ArrayList;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class TrelloCard {
    private String id;
    private String name;
    private String due;
    private String desc;
    private String idList;
    private String idBoard;
    private ArrayList<String> mList;

    public TrelloCard(String id, String name, String due, String desc, String idList, String idBoard, ArrayList<String> mList) {
        this.id = id;
        this.name = name;
        this.due = due;
        this.desc = desc;
        this.idList = idList;
        this.idBoard = idBoard;
        this.mList = mList;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDue() {
        return due;
    }

    public void setDue(String due) {
        this.due = due;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getIdList() {
        return idList;
    }

    public void setIdList(String idList) {
        this.idList = idList;
    }

    public String getIdBoard() {
        return idBoard;
    }

    public void setIdBoard(String idBoard) {
        this.idBoard = idBoard;
    }

    public ArrayList<String> getmList() {
        return mList;
    }

    public void setmList(ArrayList<String> mList) {
        this.mList = mList;
    }
  
    
    
    
}
