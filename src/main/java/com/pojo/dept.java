package com.pojo;

public class dept {

    private String deptid;
    private String deptName;

    public dept() {
    }

    public dept(String deptid, String deptName) {
        this.deptid = deptid;
        this.deptName = deptName;
    }

    public String getDeptid() {
        return deptid;
    }

    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "dept{" +
                "deptid='" + deptid + '\'' +
                ", deptName='" + deptName + '\'' +
                '}';
    }
}
