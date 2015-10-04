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
public class TrelloList {
    private String id;
    private String name;
    private boolean closed;
    private String boardId;
    private String pos;
    private boolean suscribed;

    public TrelloList(String id, String name, boolean closed, String boardId, String pos, boolean suscribed) {
        this.id = id;
        this.name = name;
        this.closed = closed;
        this.boardId = boardId;
        this.pos = pos;
        this.suscribed = suscribed;
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

    public boolean isClosed() {
        return closed;
    }

    public void setClosed(boolean closed) {
        this.closed = closed;
    }

    public String getBoardId() {
        return boardId;
    }

    public void setBoardId(String boardId) {
        this.boardId = boardId;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public boolean isSuscribed() {
        return suscribed;
    }

    public void setSuscribed(boolean suscribed) {
        this.suscribed = suscribed;
    }
    
    
}
