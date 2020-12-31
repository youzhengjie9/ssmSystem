package com.dao;

import com.pojo.comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface commentMapper {


    //前提是有回复
    comment queryCommentByDiscussIDHasReply(@Param("discussid") String discussid ,@Param("commentID") String commentID);


    //无回复

    comment queryCommentByDiscussNoReply(@Param("discussid") String discussid ,@Param("commentID") String commentID);



    //查询所有评论id
    List<String> queryAllCommentID(@Param("discussid") String discussid);


    String queryIDByCommentID(@Param("commentid") String commentid);



    void addComment(comment comment);



}
