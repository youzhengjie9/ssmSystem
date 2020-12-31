package com.service;

import com.dao.commentMapper;
import com.pojo.comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class commentServiceImpl implements commentService {

    private commentMapper commentMapper;

    @Autowired
    public void setCommentMapper(com.dao.commentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }


    @Override
    public comment queryCommentByDiscussIDHasReply(String discussid, String commentID) {
        return commentMapper.queryCommentByDiscussIDHasReply(discussid,commentID);
    }

    @Override
    public comment queryCommentByDiscussNoReply(String discussid, String commentID) {
        return commentMapper.queryCommentByDiscussNoReply(discussid, commentID);
    }

    @Override
    public List<String> queryAllCommentID(String discussid) {
        return commentMapper.queryAllCommentID(discussid);
    }

    @Override
    public String queryIDByCommentID(String commentid) {
        return commentMapper.queryIDByCommentID(commentid);
    }

    @Override
    public void addComment(comment comment) {
        commentMapper.addComment(comment);
    }
}
