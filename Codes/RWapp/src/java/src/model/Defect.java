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
public class Defect {

    private String projectName;
    private String defectName;

    private String desc;
    private String reportedBy;
    private int isComplete;
    private int severity;

    public Defect(String projectName, String defectName, String desc, String reportedBy, int isComplete, int severity) {
        this.projectName = projectName;
        this.defectName = defectName;
        this.desc = desc;
        this.reportedBy = reportedBy;
        this.isComplete = isComplete;
        this.severity = severity;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDefectName() {
        return defectName;
    }

    public void setDefectName(String defectName) {
        this.defectName = defectName;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getReportedBy() {
        return reportedBy;
    }

    public void setReportedBy(String reportedBy) {
        this.reportedBy = reportedBy;
    }

    public int getIsComplete() {
        return isComplete;
    }

    public void setIsComplete(int isComplete) {
        this.isComplete = isComplete;
    }

    public int getSeverity() {
        return severity;
    }

    public void setSeverity(int severity) {
        this.severity = severity;
    }

    @Override
    public String toString() {
        return "Defect{" + "projectName=" + projectName + ", defectName=" + defectName + ", desc=" + desc + ", reportedBy=" + reportedBy + ", isComplete=" + isComplete + ", severity=" + severity + '}';
    }
    
    
    
    
}   
