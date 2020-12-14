package com.controller;

import com.dao.logMapper;
import com.pojo.dept;
import com.pojo.logger;
import com.service.deptService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class deptController {

    private deptService deptService;
    private logMapper logMapper;

    @Autowired
    public void setLogMapper(com.dao.logMapper logMapper) {
        this.logMapper = logMapper;
    }

    @Autowired
    public void setDeptService(com.service.deptService deptService) {
        this.deptService = deptService;
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

    @RequestMapping(path = "/showDept")
    public ModelAndView showDept(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("deptList");
        List<dept> depts = deptService.queryAllDept();
        modelAndView.addObject("depts",depts);
        return modelAndView;
    }
    @RequestMapping(path = "/tochangeDept/{deptid}/{deptName}")
    public String tochangeDept(@PathVariable("deptid") String deptid,@PathVariable("deptName") String deptName, Model model){
        model.addAttribute("deptid",deptid);
        model.addAttribute("deptName",deptName);
        return "changeDept";
    }


    @RequestMapping(path = "/changeDept")
    public String changeDept(HttpServletRequest request, @Value("修改部门") String type, dept dept){
        deptService.changeDept(dept);
        //日志
        addlog(request,type);
        return "redirect:/showDept";
    }


    @RequestMapping(path = "/toAddDept")
    public String toAddDept(){
        return "addDept";
    }

    @RequestMapping(path = "/addDept")
    public String addDept(HttpServletRequest request, @Value("添加部门") String type,dept dept){
        deptService.addDept(dept);
        //日志
        addlog(request,type);
        return "redirect:/showDept";
    }

    @RequestMapping(path = "/delDept/{deptid}")
    public String delDept(HttpServletRequest request, @Value("删除部门") String type,@PathVariable("deptid") String deptid){
        deptService.delDept(deptid);
        //日志
        addlog(request,type);
        return "redirect:/showDept";
    }

}
