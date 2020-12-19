package com.pojo;

public class sign {

    /**
     * 签到表
     */
    private int num; //自动增长的编号，也就是序号，没啥作用
    private String sid; //发布者发布的签到的编号，用uuid生成，同时发布给一个部门的sid都是相同的
    private int empid; //员工编号
    private String endTime; //结束时间
    private int flag; //0代表未签到，1代表已签到


    public sign() {
    }

    public sign(String sid, int empid, String endTime, int flag) {
        this.sid = sid;
        this.empid = empid;
        this.endTime = endTime;
        this.flag = flag;
    }



    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "sign{" +
                "sid='" + sid + '\'' +
                ", empid=" + empid +
                ", endTime='" + endTime + '\'' +
                ", flag=" + flag +
                '}';
    }
}
