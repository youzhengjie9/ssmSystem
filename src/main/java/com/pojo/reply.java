package com.pojo;

import java.io.Serializable;

public class reply implements Serializable {
    /**
     * 回复表
     */
    private String replyid; //回复id uuid生成
    private String discussID; //评论id
    private String replyContent; //回复内容
    private String replyTime; //回复日期
    private String id; //回复者id

    public reply() {
    }

    public reply(String replyid, String discussID, String replyContent, String replyTime, String id) {
        this.replyid = replyid;
        this.discussID = discussID;
        this.replyContent = replyContent;
        this.replyTime = replyTime;
        this.id = id;
    }

    public String getReplyid() {
        return replyid;
    }

    public void setReplyid(String replyid) {
        this.replyid = replyid;
    }

    public String getDiscussID() {
        return discussID;
    }

    public void setDiscussID(String discussID) {
        this.discussID = discussID;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
