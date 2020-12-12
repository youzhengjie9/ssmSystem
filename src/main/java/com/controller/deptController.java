package com.controller;

import com.pojo.dept;
import com.service.deptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class deptController {

    private deptService deptService;

    @Autowired
    public void setDeptService(com.service.deptService deptService) {
        this.deptService = deptService;
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
    public String changeDept(dept dept){
        deptService.changeDept(dept);
        return "redirect:/showDept";
    }


    @RequestMapping(path = "/toAddDept")
    public String toAddDept(){
        return "addDept";
    }

    @RequestMapping(path = "/addDept")
    public String addDept(dept dept){
        deptService.addDept(dept);
        return "redirect:/showDept";
    }

    @RequestMapping(path = "/delDept/{deptid}")
    public String delDept(@PathVariable("deptid") String deptid){
        deptService.delDept(deptid);
        return "redirect:/showDept";
    }

}
