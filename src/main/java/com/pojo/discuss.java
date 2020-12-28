package com.pojo;

import java.io.Serializable;

public class discuss implements Serializable {
    /**
     * 讨论表
     */
    private String discussid; //帖子id
    private String discusscontent; //帖子内容
    private String discusstime; //发帖时间
    private String id; //发布帖子者id
    private String discussTitle; //帖子标题



    public discuss() {
    }

    public discuss(String discussid, String discusscontent, String discusstime, String id, String discussTitle) {
        this.discussid = discussid;
        this.discusscontent = discusscontent;
        this.discusstime = discusstime;
        this.id = id;
        this.discussTitle = discussTitle;
    }

    public String getDiscussid() {
        return discussid;
    }

    public void setDiscussid(String discussid) {
        this.discussid = discussid;
    }

    public String getDiscusscontent() {
        return discusscontent;
    }

    public void setDiscusscontent(String discusscontent) {
        this.discusscontent = discusscontent;
    }

    public String getDiscusstime() {
        return discusstime;
    }

    public void setDiscusstime(String discusstime) {
        this.discusstime = discusstime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDiscussTitle() {
        return discussTitle;
    }

    public void setDiscussTitle(String discussTitle) {
        this.discussTitle = discussTitle;
    }

    @Override
    public String toString() {
        return "discuss{" +
                "discussid='" + discussid + '\'' +
                ", discusscontent='" + discusscontent + '\'' +
                ", discusstime='" + discusstime + '\'' +
                ", id='" + id + '\'' +
                ", discussTitle='" + discussTitle + '\'' +
                '}';
    }
}
