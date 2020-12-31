package com.service;

import com.pojo.reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface replyService {


    List<reply> queryReplyByCommentID(String commentid);


}
