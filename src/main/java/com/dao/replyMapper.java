package com.dao;

import com.pojo.reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface replyMapper {



    List<reply> queryReplyByCommentID(@Param("commentid") String commentid);

    //回复
    void  addReply(reply reply);




}
