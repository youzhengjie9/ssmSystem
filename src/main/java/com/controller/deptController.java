package com.controller;

import com.pojo.dept;
import com.service.deptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

}
