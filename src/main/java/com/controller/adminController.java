package com.controller;

import com.pojo.admin;
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

@Controller
public class adminController {

    private adminService adminService;
    private authorityService authorityService;

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

    @RequestMapping(path = "/changgeAdmin",method = {RequestMethod.POST})
    public String changgeAdmin(HttpServletRequest request, @Value("") String type,admin admin){
        adminService.changeAdmin(admin);
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
    public String AddAdmin(HttpServletRequest request, @Value("") String type,admin admin){
        adminService.addAdmin(admin);
        return "redirect:/adminList";
    }

    @RequestMapping(path = "/delAdmin/{id}")
    public String delAdmin(HttpServletRequest request, @Value("") String type,@PathVariable("id") String id){
         adminService.delAdmin(id);
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
