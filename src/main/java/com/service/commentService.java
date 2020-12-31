package com.service;

import com.pojo.comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface commentService {

    //前提是有回复
    comment queryCommentByDiscussIDHasReply(String discussid, String commentID);

    //无回复

    comment queryCommentByDiscussNoReply(String discussid , String commentID);

    //查询所有评论id
    List<String> queryAllCommentID(String discussid);

    String queryIDByCommentID(String commentid);

    void addComment(comment comment);
}
