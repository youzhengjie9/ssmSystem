package com.controller;

import com.dao.logMapper;
import com.pojo.admin;
import com.pojo.authority;
import com.pojo.emp;
import com.pojo.logger;
import com.service.adminService;
import com.service.deptService;
import com.service.empService;
import com.service.logService;
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
    private logService logService;
    private adminService adminService;

    @Autowired
    public void setAdminService(com.service.adminService adminService) {
        this.adminService = adminService;
    }

    @Autowired
    public void setLogService(com.service.logService logService) {
        this.logService = logService;
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
        model.addAttribute("depts",deptService.queryAllDept());
        Subject subject = SecurityUtils.getSubject();
        model.addAttribute("user",subject.getPrincipal());
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
        logService.addLog(new logger(logid,id,type,operation,dateTime,""));
    }



    @RequestMapping(path = "/AddEmp")
    public String AddEmp(HttpServletRequest request, @Value("添加员工、开通员工帐号") String type,emp emp){
        empService.addEmp(new emp(emp.getEmpid(),emp.getEmpName(),emp.getDept(),new admin("123456"+emp.getEmpid(),"123456",new authority(1,"普通用户"))));
        adminService.addAdmin(new admin("123456"+emp.getEmpid(),"123456",new authority(1,"普通用户"))); //添加员工之后，为员工开一个账户
        //日志
        addlog(request,type);

        return "redirect:/toEmpList";
    }



    @RequestMapping(path = "/changeEmp")
    public String changeEmp(HttpServletRequest request, @Value("修改员工信息") String type,emp emp){
        empService.changeEmp(emp);
        //日志
        addlog(request,type);

        return "redirect:/toEmpList";
    }

    @RequestMapping(path = "/delEmp/{empid}")
    public String delEmp(HttpServletRequest request, @Value("删除员工、员工帐号") String type,@PathVariable("empid") String empid){
        String id = empService.queryEmpAdminID(empid);
        empService.delEmp(empid);
        adminService.delAdmin(id);
        //日志
        addlog(request,type);

        return "redirect:/toEmpList";
    }


}
