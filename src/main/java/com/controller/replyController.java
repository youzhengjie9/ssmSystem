package com.controller;

import com.pojo.reply;
import com.service.replyService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pojo.reply;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
public class replyController {

    private replyService replyService;


    @Autowired
    public void setReplyService(com.service.replyService replyService) {
        this.replyService = replyService;
    }

    @RequestMapping(path = "/reply")
    public String reply(String discussID, reply reply){

        String replyid = UUID.randomUUID().toString().replaceAll("-", "");
        String commentID = reply.getCommentID();
        String replyContent = reply.getReplyContent();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(date);
        Subject subject = SecurityUtils.getSubject();
        String rid = (String) subject.getPrincipal();
        String pid = reply.getPid();

        reply myreply = new reply(replyid,commentID,replyContent,time,rid,pid);
        replyService.addReply(myreply);


        String viewName="redirect:/todiscussInfoList/"+discussID;
        return viewName;
    }



}
