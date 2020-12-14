package com.controller;

import com.dao.logMapper;
import com.pojo.emp;
import com.pojo.logger;
import com.service.deptService;
import com.service.empService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class empController {

    private empService empService;
    private deptService deptService;
    private com.dao.logMapper logMapper;

    @Autowired
    public void setLogMapper(com.dao.logMapper logMapper) {
        this.logMapper = logMapper;
    }
    @Autowired
    public void setDeptService(com.service.deptService deptService) {
        this.deptService = deptService;
    }

    @Autowired
    public void setEmpService(com.service.empService empService) {
        this.empService = empService;
    }

    @RequestMapping(path = "/toEmpList")
    public String toEmpList(HttpServletRequest request, @Value("") String type, Model model){
        model.addAttribute("emps",empService.queryAllEmp());
//
//        Subject subject = SecurityUtils.getSubject();
//        System.out.println(subject.getPrincipal());

//        System.out.println(request.getServletPath());

        return "empList";
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

    @RequestMapping(path = "/toAddEmp")
    public String toAddEmp(Model model){
        model.addAttribute("depts",deptService.queryAllDept());
        return "addEmp";
    }

    @RequestMapping(path = "/AddEmp")
    public String AddEmp(HttpServletRequest request, @Value("添加员工") String type,emp emp){
        empService.addEmp(emp);
        //日志
        addlog(request,type);

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
    public String changeEmp(HttpServletRequest request, @Value("修改员工信息") String type,emp emp){
        empService.changeEmp(emp);
        //日志
        addlog(request,type);

        return "redirect:/toEmpList";
    }

    @RequestMapping(path = "/delEmp/{empid}")
    public String delEmp(HttpServletRequest request, @Value("删除员工") String type,@PathVariable("empid") String empid){
       empService.delEmp(empid);
        //日志
        addlog(request,type);

        return "redirect:/toEmpList";
    }


}
