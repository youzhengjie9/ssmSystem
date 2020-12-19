package com.pojo;

public class publish {

    /**
     * 发布签到信息
     */
    private String sid; //签到id
    private String id;  //发布者id
    private String startTime; //签到开始时间
    private String endTime; //签到结束时间
    private String deptName; //目标部门

    public publish() {
    }

    public publish(String sid, String id, String startTime, String endTime, String deptName) {
        this.sid = sid;
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.deptName = deptName;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "publish{" +
                "sid='" + sid + '\'' +
                ", id='" + id + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", deptName='" + deptName + '\'' +
                '}';
    }
}
