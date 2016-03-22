/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

/**
 *
 * @author Kesmeen Tan
 */
public class Notification {
    private int id;
    private String username;
    private String notificationType;
    private String projectname;
    private String status;
    private String datetime;

    public Notification(int id, String username, String notificationType, String projectname, String status, String datetime) {
        this.id = id;
        this.username = username;
        this.notificationType = notificationType;
        this.projectname = projectname;
        this.status = status;
        this.datetime = datetime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    
    public String toString(){
        String toReturn = null;
        if(notificationType.equals("assignedProject")){
            toReturn = "You have been assigned to project " + projectname;
        } else if(notificationType.indexOf("assignedDefect")!=-1){
            toReturn = "Your have been assigned a defect under project " + projectname;
        } else if(notificationType.indexOf("rejectedDefect")!=-1){
            toReturn = "Your defect completion under project " + projectname + "has been rejected";
        } else if(notificationType.indexOf("markCompletedDefect")!=-1){
            toReturn = "A defect has been mark completed under project " + projectname;
        }
        
        return toReturn;
    }
    
    public String toLink(){
        String toReturn = null;
        if(notificationType.equals("assignedProject")){
            toReturn = "viewProjectInfo.jsp?projectName=" + projectname;
        } else if(notificationType.indexOf("assignedDefect")!=-1){
            toReturn = "viewDefectInfo.jsp?defectId=" + notificationType.substring(14);
        } else if(notificationType.indexOf("rejectedDefect")!=-1){
            toReturn = "viewDefectInfo.jsp?defectId=" + notificationType.substring(14);
        } else if(notificationType.indexOf("markCompletedDefect")!=-1){
            toReturn = "viewDefectInfo.jsp?defectId=" + notificationType.substring(19);
        }
        
        return toReturn;
    }
        
}
