package com.pojo;

public class emp {

    private int empid;
    private String empName;
//    private String deptid;
    private dept dept;
    private admin admin; //每个员工都有admin帐号

    public emp() {
    }

    public emp(int empid, String empName, com.pojo.dept dept, com.pojo.admin admin) {
        this.empid = empid;
        this.empName = empName;
        this.dept = dept;
        this.admin = admin;
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public com.pojo.dept getDept() {
        return dept;
    }

    public void setDept(com.pojo.dept dept) {
        this.dept = dept;
    }

    public com.pojo.admin getAdmin() {
        return admin;
    }

    public void setAdmin(com.pojo.admin admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "emp{" +
                "empid=" + empid +
                ", empName='" + empName + '\'' +
                ", dept=" + dept +
                ", admin=" + admin +
                '}';
    }
}
