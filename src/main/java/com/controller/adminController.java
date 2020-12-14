package com.controller;

import com.dao.logMapper;
import com.pojo.admin;
import com.pojo.logger;
import com.service.adminService;
import com.service.authorityService;
import com.service.deptService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
public class adminController {

    private adminService adminService;
    private authorityService authorityService;
    private logMapper logMapper;

    @Autowired
    public void setLogMapper(com.dao.logMapper logMapper) {
        this.logMapper = logMapper;
    }

    @Autowired
    public void setAuthorityService(com.service.authorityService authorityService) {
        this.authorityService = authorityService;
    }

    @Autowired
    public void setAdminService(com.service.adminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping(path = "/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(path = "/toList")
    public String toList(){
        return "list";
    }

    @RequestMapping(path = "/toUnauthorized")
    public String toUnauthorized(){
        return "unauthorized";
    }


    @RequestMapping(path = "/logout")
    public String logout(){
        return "login";
    }
    @RequestMapping(path = "/adminList")
    public String adminList( Model model){
        model.addAttribute("admin",adminService.queryAllAdmin());
        return "adminList";
    }

    //抽取日志方法
    public  void addlog(HttpServletRequest request,String type){
        //日志操作
        String logid = UUID.randomUUID().toString().replaceAll("-", "");
        Subject subject = SecurityUtils.getSubject();
        String id = (String) subject.getPrincipal();
        String operation=request.getServletPath();
        Date date = new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = dateFormat.format(date);
        logMapper.addLog(new logger(logid,id,type,operation,dateTime,""));
    }



    @RequestMapping(path = "/changgeAdmin",method = {RequestMethod.POST})
    public String changgeAdmin(HttpServletRequest request, @Value("修改管理员信息") String type,admin admin){
        adminService.changeAdmin(admin);

        //日志
        addlog(request,type);


        return "redirect:/adminList";
    }
    @RequestMapping(path = "/TochanggeAdmin/{id}")
    public String TochanggeAdmin(@PathVariable("id") String id, Model model){
        model.addAttribute("id",id);
        model.addAttribute("authorities",authorityService.queryAllAutho());
        return "changgeAdminList";
    }
    @RequestMapping(path = "/toAddAdmin")
    public String toAddAdmin(Model model){
        model.addAttribute("authorities",authorityService.queryAllAutho());
        return "addAdmin";
    }

    @RequestMapping(path = "/AddAdmin")
    public String AddAdmin(HttpServletRequest request, @Value("添加管理员") String type,admin admin){
        adminService.addAdmin(admin);
        //日志
        addlog(request,type);
        return "redirect:/adminList";
    }

    @RequestMapping(path = "/delAdmin/{id}")
    public String delAdmin(HttpServletRequest request, @Value("删除管理员") String type,@PathVariable("id") String id){
         adminService.delAdmin(id);
        //日志
        addlog(request,type);
        return "redirect:/adminList";
    }







    @RequestMapping(path = "/checkLogin")
    public String checkLogin(String id,String password){
        System.out.println("checkLogin");
        Subject currentSubject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken=new UsernamePasswordToken(id,password);
        if(!currentSubject.isAuthenticated()){
            try{

                currentSubject.login(usernamePasswordToken);
                return "list";
            }catch (Exception e){
                System.out.println(e.getMessage());
                return "login";

            }


        }

        return "list";
    }



}
