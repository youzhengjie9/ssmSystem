package com.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class downloadController {




    @RequestMapping(path = "/todownload")
    public String todownload(HttpServletRequest request, Model model){
        ServletContext servletContext = request.getSession().getServletContext();
        String dir = servletContext.getRealPath("upload");
        File dirfile=new File(dir);
        File[] files = dirfile.listFiles();
        List<String> fs=new ArrayList<>();
        if(files.length>0){
            for (File file : files) {
                fs.add(file.getName());
            }

        }
        model.addAttribute("fileNames",fs);

        Subject subject = SecurityUtils.getSubject();
        String user = (String) subject.getPrincipal();

        model.addAttribute("user",user);
        return "download";
    }
    @RequestMapping(path = "/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
        String dir = request.getSession().getServletContext().getRealPath("upload");
        String filename = request.getParameter("filename");
        String filepath=dir+"\\"+filename;
        System.out.println(filepath);
        BufferedInputStream inputStream=new BufferedInputStream(new FileInputStream(filepath));
        byte bytes[]=new byte[inputStream.available()];
        inputStream.read(bytes);

        HttpHeaders headers=new HttpHeaders();
        headers.add("Content-Disposition","attachment;filename*=UTF-8''"+ URLEncoder.encode(filename,"UTF-8"));


        ResponseEntity<byte[]> responseEntity=new ResponseEntity<byte[]>(bytes,headers,HttpStatus.OK);


        inputStream.close();


        return responseEntity;
    }



















}
