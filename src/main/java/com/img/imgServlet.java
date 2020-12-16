package com.img;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;

public class imgServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("image/jpeg");
        String imgpath="C:\\java代码\\ssmzhenghe\\target\\ssmzhenghe-1.0-SNAPSHOT\\img\\img-admin.png";

        BufferedImage read = ImageIO.read(new File(imgpath));
        ImageIO.write(read,"png",resp.getOutputStream());
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
