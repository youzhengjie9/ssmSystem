package com.pojo;

import java.io.Serializable;
import java.util.List;

public class comment implements Serializable {
    /**
     * 评论表
     */
    private String commentID; //评论id
    private String discussID; //帖子id
    private String id;  //发布评论者id
    private String commentContent; //评论内容
    private String commentTime; //评论日期
    private List<reply> replys; //回复

    public comment() {
    }

//    用于传输comment对象
    public comment(String commentID, String discussID, String id, String commentContent, String commentTime) {
        this.commentID = commentID;
        this.discussID = discussID;
        this.id = id;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
    }


    public comment(String commentID, String discussID, String id, String commentContent, String commentTime, List<reply> replys) {
        this.commentID = commentID;
        this.discussID = discussID;
        this.id = id;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
        this.replys = replys;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getDiscussID() {
        return discussID;
    }

    public void setDiscussID(String discussID) {
        this.discussID = discussID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public List<reply> getReplys() {
        return replys;
    }

    public void setReplys(List<reply> replys) {
        this.replys = replys;
    }

    @Override
    public String toString() {
        return "comment{" +
                "commentID='" + commentID + '\'' +
                ", discussID='" + discussID + '\'' +
                ", id='" + id + '\'' +
                ", commentContent='" + commentContent + '\'' +
                ", commentTime='" + commentTime + '\'' +
                ", replys=" + replys +
                '}';
    }
}
