package com.pojo;

public class logger {

    private String logid; //日志编号
    private String id; //用户id
    private String type; //操作类型
    private String operation; //内容
    private String date; //datetime可以识别特定格式的字符串，将它自动转换为datetime
    private String remark; //备注

    public logger() {
    }

    public logger(String logid, String id, String type, String operation, String date, String remark) {
        this.logid = logid;
        this.id = id;
        this.type = type;
        this.operation = operation;
        this.date = date;
        this.remark = remark;
    }

    public String getLogid() {
        return logid;
    }

    public void setLogid(String logid) {
        this.logid = logid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "logger{" +
                "logid='" + logid + '\'' +
                ", id='" + id + '\'' +
                ", type='" + type + '\'' +
                ", operation='" + operation + '\'' +
                ", date='" + date + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
