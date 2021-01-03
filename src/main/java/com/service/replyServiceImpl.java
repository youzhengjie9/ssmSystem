package com.service;

import com.dao.replyMapper;
import com.pojo.reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class replyServiceImpl implements replyService {

    private replyMapper replyMapper;

    @Autowired
    public void setReplyMapper(com.dao.replyMapper replyMapper) {
        this.replyMapper = replyMapper;
    }

    @Override
    public List<reply> queryReplyByCommentID(String commentid) {
        return replyMapper.queryReplyByCommentID(commentid);
    }

    @Override
    public void addReply(reply reply) {
        replyMapper.addReply(reply);
    }
}
