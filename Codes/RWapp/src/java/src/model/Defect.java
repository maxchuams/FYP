/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.model;

import java.util.Date;

/**
 *
 * @author maxchua
 */
public class Defect {

    private int id;
    private String projectName;
    private String defectName;
    private String updateTime;
    private String desc;
    private String reportedBy;
    private int isComplete;
    private int severity;
    private Date duedate;
    private String assignto;

    /**
     * creates a new Defect object
     * @param id the id of the defect
     * @param projectName the project of which the defect belongs to
     * @param defectName the name of the defect
     * @param desc the description of the defect
     * @param reportedBy the person that added the defected
     * @param updateTime the time at which the defect was updated or added
     * @param isComplete the completion status of the defect
     * @param severity the severity of the defect
     * @param duedate the date that the defect is due
     * @param assignto the developer that is being assigned to the defect
     */
    public Defect(int id, String projectName, String defectName, String desc, String reportedBy, String updateTime, int isComplete, int severity, Date duedate, String assignto) {
        this.id = id;
        this.projectName = projectName;
        this.defectName = defectName;
        this.desc = desc;
        this.reportedBy = reportedBy;
        this.updateTime = updateTime;
        this.isComplete = isComplete;
        this.severity = severity;
        this.duedate = duedate;
        this.assignto = assignto;
    }

    /**
     *
     * @return the projectname
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     *Set the project name
     * @param projectName name of the project
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     *
     * @return the defect name
     */
    public String getDefectName() {
        return defectName;
    }

    /**
     *Set the defect name
     * @param defectName name of the defect
     */
    public void setDefectName(String defectName) {
        this.defectName = defectName;
    }

    /**
     *
     * @return the description of the defect
     */
    public String getDesc() {
        return desc;
    }

    /**
     *Set the description of the defect
     * @param desc the description of the defect
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     *
     * @return the person that reported the defect
     */
    public String getReportedBy() {
        return reportedBy;
    }

    /**
     *Set the Person who reported the defect to the defect
     * @param reportedBy the person who reported the defect
     */
    public void setReportedBy(String reportedBy) {
        this.reportedBy = reportedBy;
    }

    /**
     *
     * @return the completion status of the defect
     */
    public int getIsComplete() {
        return isComplete;
    }

    /**
     *Set the completion status of the project
     * @param isComplete the completion status of the defect
     */
    public void setIsComplete(int isComplete) {
        this.isComplete = isComplete;
    }

    /**
     *
     * @return the severity of the defect
     */
    public int getSeverity() {
        return severity;
    }

    /**
     *Set the severity status of the defect
     * @param severity the severity of the defect
     */
    public void setSeverity(int severity) {
        this.severity = severity;
    }

    /**
     *
     * @return the id of the defect
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @param defectName the name of the defect
     * @return
     */
    public int getId(String defectName) {
        return id;
    }

    /**
     *
     * @return the due date of the defect
     */
    public Date getDuedate() {
        return duedate;
    }

    /**
     *
     * @param id the id of the defect
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * @return the latest time the defect was updated
     */
    public String getUpdateTime() {
        return updateTime;
    }

    /**
     *
     * @param updateTime the latest time the defect was updated
     */
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    /**
     *
     * @param due the due date of the defect
     */
    public void setDuedate(Date due) {
        this.duedate = due;
    }

    /**
     *
     * @return the developer that was assigned to the project
     */
    public String getAssignto() {
        return assignto;
    }

    /**
     *
     * @param assignto the developer that the defect is being assigned to
     */
    public void setAssignto(String assignto) {
        this.assignto = assignto;
    }

    @Override
    public String toString() {
        return "Defect{" + "id=" + id + ", projectName=" + projectName + ", defectName=" + defectName + ", updateTime=" + updateTime + ", desc=" + desc + ", reportedBy=" + reportedBy + ", isComplete=" + isComplete + ", severity=" + severity + ", dudedate=" + duedate.toString() + '}';
    }

}
