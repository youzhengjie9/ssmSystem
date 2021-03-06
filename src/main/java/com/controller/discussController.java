package com.controller;

import com.pojo.comment;
import com.pojo.discuss;
import com.pojo.reply;
import com.service.commentService;
import com.service.discussService;
import com.service.replyService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Controller
public class discussController {

    private discussService discussService;
    private commentService commentService;
    private replyService replyService;


    @Autowired
    public void setReplyService(com.service.replyService replyService) {
        this.replyService = replyService;
    }

    @Autowired
    public void setCommentService(com.service.commentService commentService) {
        this.commentService = commentService;
    }

    @Autowired
    public void setDiscussService(com.service.discussService discussService) {
        this.discussService = discussService;
    }

    @RequestMapping(path = "/todiscuss")
    public String todiscuss(Model model){
        List<discuss> discusses = discussService.queryAllDiscuss();
        model.addAttribute("discusses",discusses);
        Subject subject = SecurityUtils.getSubject();
        model.addAttribute("user",subject.getPrincipal());
        return "discussList";
    }
    //发布讨论
    @RequestMapping(path = "/discuss")
    public String discuss(String discusscontent,String discussTitle){
        String discussid= UUID.randomUUID().toString().replaceAll("-","");

        Subject subject = SecurityUtils.getSubject();
        String id= (String) subject.getPrincipal();
        System.out.println(discusscontent);
        System.out.println(discussTitle);
        Date dt = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = simpleDateFormat.format(dt);

        discuss discuss = new discuss(discussid,discusscontent,datetime,id,discussTitle);
        discussService.addDiscuss(discuss);
        return "redirect:/todiscuss";
    }


    @RequestMapping(path = "/userImage/{id}")
    public void getUserImage(@PathVariable("id") String id,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("image/jpeg");
        String path=request.getSession().getServletContext().getRealPath("img");
        String imgpath=path+"\\img-"+id+".jpg";
        if(new File(imgpath).exists()){
            BufferedImage read = ImageIO.read(new FileInputStream(imgpath));
            ImageIO.write(read,"jpg",response.getOutputStream());
        }
    }


    /**
     * 论坛详情页
     */

    @RequestMapping(path = "/todiscussInfoList/{discussID}")
    public String todiscussInfoList(@PathVariable("discussID") String discussID,Model model){
        //如果discussID在数据库没找到，则跳转到404页面
        discuss discuss = discussService.queryDiscussByID(discussID);
        if(discuss==null){
            return "error_404";
        }else {
            model.addAttribute("discuss",discuss);
            List<comment> comments=new LinkedList<>();
            //1.获得所有commentid
            List<String> commentIDs = commentService.queryAllCommentID(discussID);



            for (String commentID : commentIDs) {

                List<reply> reply = replyService.queryReplyByCommentID(commentID);


                if(reply==null||reply.size()==0){
                    comment comment = commentService.queryCommentByDiscussNoReply(discussID, commentID);


                    comments.add(comment);
                }else {
                    comment comment = commentService.queryCommentByDiscussIDHasReply(discussID, commentID);


                    comments.add(comment);
                }
            }
            model.addAttribute("comments",comments);




        }

        return "discussInfoList";

    }










}
