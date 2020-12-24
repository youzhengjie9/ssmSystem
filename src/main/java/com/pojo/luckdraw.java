package com.pojo;

public class luckdraw {

    private int empid;
    private String empName;
    private dept dept;
    private String draw;
    private String date; //中奖日期

    public luckdraw() {
    }

    public luckdraw(int empid, String empName, com.pojo.dept dept, String draw, String date) {
        this.empid = empid;
        this.empName = empName;
        this.dept = dept;
        this.draw = draw;
        this.date = date;
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

    public String getDraw() {
        return draw;
    }

    public void setDraw(String draw) {
        this.draw = draw;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "luckdraw{" +
                "empid=" + empid +
                ", empName='" + empName + '\'' +
                ", dept=" + dept +
                ", draw='" + draw + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}
