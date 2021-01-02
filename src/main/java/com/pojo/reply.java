package com.pojo;

import java.io.Serializable;

public class reply implements Serializable {
    /**
     * 回复表
     */
    private String replyid; //回复id uuid生成
    private String commentID; //评论id
    private String replyContent; //回复内容
    private String replyTime; //回复日期
    private String rid; //回复者id
    private String pid; //评论者id   ==》相当于comment的id

    public reply() {
    }

    public reply(String replyid, String commentID, String replyContent, String replyTime, String rid, String pid) {
        this.replyid = replyid;
        this.commentID = commentID;
        this.replyContent = replyContent;
        this.replyTime = replyTime;
        this.rid = rid;
        this.pid = pid;
    }



    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getReplyid() {
        return replyid;
    }

    public void setReplyid(String replyid) {
        this.replyid = replyid;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
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
        return rid;
    }

    public void setId(String id) {
        this.rid = id;
    }

    @Override
    public String toString() {
        return "reply{" +
                "replyid='" + replyid + '\'' +
                ", commentID='" + commentID + '\'' +
                ", replyContent='" + replyContent + '\'' +
                ", replyTime='" + replyTime + '\'' +
                ", rid='" + rid + '\'' +
                ", pid='" + pid + '\'' +
                '}';
    }
}
