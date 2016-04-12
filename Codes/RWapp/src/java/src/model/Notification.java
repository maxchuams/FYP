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
    String archived;
	/**
     *Create a new Notification object
     * @param id the unique identifier of the notification
     * @param username the username of the person to inform
     * @param notificationType the type of notification
     * @param projectname project name related to this notification
     * @param status the status of the notification, T or F
     * @param datetime the date and time the notification was created
     * @param archived the archiving status of the notification, T or F
     */
    public Notification(int id, String username, String notificationType, String projectname, String status, String datetime, String archived) {
        this.id = id;
        this.username = username;
        this.notificationType = notificationType;
        this.projectname = projectname;
        this.status = status;
        this.datetime = datetime;
        this.archived = archived;
    }
    
    /**
     *returns id the unique identifier of the notification
     * @return id of the notification
     */
    public int getId() {
        return id;
    }
    
    /**
     *Set Id of notification
     * @param id the unique identifier of the notification
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     *returns username of user related to the notification
     * @return username related to the notification
     */

    public String getUsername() {
        return username;
    }
    
    /**
     *Set user to inform in this notification 
     * @param username the username of the person to inform
     */

    public void setUsername(String username) {
        this.username = username;
    }
    
    /**
     *returns type of the notification
     * @return type of notification
     */
    public String getNotificationType() {
        return notificationType;
    }
    /**
     *Set notification type of this notification 
     * @param notificationType the type of notification
     */

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }
    /**
     *returns project name of the notification
     * @return project name related to the notification
     */
    public String getProjectname() {
        return projectname;
    }
    /**
     *Set project name related to this notification 
     * @param projectname project name related to this notification
     */

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }
    /**
     *returns read status of the notification
     * @return T or F, read or unread respectively of the status of notification
     */
    public String getStatus() {
        return status;
    }

    /**
     *Set read status of this notification 
     * @param status the status of the notification, T or F
     */

    public void setStatus(String status) {
        this.status = status;
    }
    /**
     *returns date and time created of the notification
     * @return creation date of notification
     */
    public String getDatetime() {
        return datetime;
    }
    
    /**
     *Set date and time creation of this notification 
     * @param datetime the date and time the notification was created
     */


    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
    /**
     *returns String of the notification
     * @return the String of the notification the user will see
     */
    
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
    /**
     *returns archive status of notification
     * @return T,F archived or unarchived respectively for the archive status of notification
     */
    public String getArchived() {
        return archived;
    }
    
    /**
     *Set archived status of this notification 
     * @param archived the archived status of the notification, T or F
     */

    public void setArchived(String archived) {
        this.archived = archived;
    }
    /**
     *returns link related to the notification
     * @return the link of the notification that the user will be directed to on click
     */
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
