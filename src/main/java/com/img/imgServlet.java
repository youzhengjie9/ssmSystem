package com.img;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;

public class imgServlet extends HttpServlet {
//    private final String[] formats={"bmp","jpg","png","jpeg","gif"};

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("image/jpeg");

        String path=req.getSession().getServletContext().getRealPath("img");
        Subject subject = SecurityUtils.getSubject();
        String imgpath=path+"\\img-"+subject.getPrincipal()+".jpg";
        if(new File(imgpath).exists()){
            BufferedImage read = ImageIO.read(new File(imgpath));

            ImageIO.write(read,"jpg",resp.getOutputStream());
        }

//        String imgpath="C:\\java代码\\ssmzhenghe\\target\\ssmzhenghe-1.0-SNAPSHOT\\img\\img-admin.png";


    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
