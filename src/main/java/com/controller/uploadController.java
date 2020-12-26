package com.controller;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.*;

@Controller
public class uploadController {
//    private final String[] formats={"bmp","jpg","png","jpeg","gif"};


    @RequestMapping(path = "/upload")
    public String upload(HttpServletRequest request, Model model, MultipartFile multipartFile) throws IOException {
        String path=request.getSession().getServletContext().getRealPath("img");
        Subject subject = SecurityUtils.getSubject();
        model.addAttribute("user",subject.getPrincipal());
        String imgpath=path+"\\img-"+subject.getPrincipal()+".jpg";
        String filename = multipartFile.getOriginalFilename();
        //判断是否是图片类型
        String format="";//·bmp ·jpg ·png ·jpeg ·gif
        for (int i = filename.length()-1; i >=0; i--) {
            if(filename.charAt(i)=='.'){
                break;
            }else{
                format+=filename.charAt(i);
            }
        }
        //因为是反向读取，所以判断的后缀名也要反向
        if(format.equals("pmb")||format.equals("gpj")||format.equals("gnp")||format.equals("gepj") || format.equals("fig"))
        {
//        System.out.println("是图片格式");
            InputStream in = multipartFile.getInputStream();
//            byte[] bytes=new byte[in.available()];
//            in.read(bytes);

            //图片压缩
            Thumbnails.of(in).size(47,47).toFile(imgpath);


//            BufferedOutputStream bufferedOutputStream=new BufferedOutputStream(new FileOutputStream(imgpath));
////            BufferedImage bufferedImage=new BufferedImage(55,55,BufferedImage.TYPE_INT_RGB);
////            bufferedImage.
//            bufferedOutputStream.write(bytes);
//            bufferedOutputStream.flush();
//            bufferedOutputStream.close();


        }else {

//            System.out.println("不是图片格式");
        }




        return "list";
    }



    //上传文件
    @RequestMapping(path = "/uploadFile")
    public String uploadFile(HttpServletRequest request,MultipartFile multipartFile) throws IOException {

        String dirpath = request.getSession().getServletContext().getRealPath("upload");
        File dir = new File(dirpath);
        if(!dir.exists()){
            dir.mkdir();
        }
        String filename = multipartFile.getOriginalFilename();
        InputStream inputStream = multipartFile.getInputStream();
        byte bytes[]=new byte[inputStream.available()];
        inputStream.read(bytes);
        String filepath=dirpath+"\\"+filename;
        BufferedOutputStream bufferedOutputStream=new BufferedOutputStream(new FileOutputStream(filepath));

        bufferedOutputStream.write(bytes);

        bufferedOutputStream.flush();


        bufferedOutputStream.close();
        inputStream.close();



        return "redirect:/todownload";
    }






}
