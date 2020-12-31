package com.controller;

import com.pojo.comment;
import com.service.commentService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
public class commentController {


    private commentService commentService;

    @Autowired
    public void setCommentService(com.service.commentService commentService) {
        this.commentService = commentService;
    }

    @RequestMapping(path = "/addComment")
    public String addComment(String discussID,String commentContent){
        String commentid = UUID.randomUUID().toString().replaceAll("-", "");
        Subject subject = SecurityUtils.getSubject();
        String id= (String) subject.getPrincipal();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = simpleDateFormat.format(date);
        comment comment = new comment(commentid,discussID,id,commentContent,curDate);
        commentService.addComment(comment);


        String viewName="redirect:/todiscussInfoList/"+discussID;


        return viewName;
    }





}
