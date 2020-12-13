package com.controller;

import com.pojo.emp;
import com.service.deptService;
import com.service.empService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class empController {

    private empService empService;
    private deptService deptService;

    @Autowired
    public void setDeptService(com.service.deptService deptService) {
        this.deptService = deptService;
    }

    @Autowired
    public void setEmpService(com.service.empService empService) {
        this.empService = empService;
    }

    @RequestMapping(path = "/toEmpList")
    public String toEmpList(Model model){
        model.addAttribute("emps",empService.queryAllEmp());

        return "empList";
    }
    @RequestMapping(path = "/toAddEmp")
    public String toAddEmp(Model model){
        model.addAttribute("depts",deptService.queryAllDept());
        return "addEmp";
    }

    @RequestMapping(path = "/AddEmp")
    public String AddEmp(emp emp){
        empService.addEmp(emp);
        return "redirect:/toEmpList";
    }

    @RequestMapping(path = "/tochangeEmp/{empid}")
    public String tochangeEmp(@PathVariable("empid") String empid, Model model){
        model.addAttribute("empid",empid);
        List<emp> emps = empService.queryAllEmp();
        for (emp emp : emps) {
            if(emp.getEmpid()==Integer.parseInt(empid)){
                model.addAttribute("empName",emp.getEmpName());
                break;
            }
        }
        model.addAttribute("depts",deptService.queryAllDept());
        return "changeEmp";
    }

    @RequestMapping(path = "/changeEmp")
    public String changeEmp(emp emp){
        empService.changeEmp(emp);
        return "redirect:/toEmpList";
    }

    @RequestMapping(path = "/delEmp/{empid}")
    public String delEmp(@PathVariable("empid") String empid){
       empService.delEmp(empid);
        return "redirect:/toEmpList";
    }


}
