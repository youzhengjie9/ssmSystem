package com.controller;

import com.service.logService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class logController {
    private logService logService;

    @Autowired
    public void setLogService(com.service.logService logService) {
        this.logService = logService;
    }

    @RequestMapping(path = "/toLogList")
    public String toLogList(Model model){
        model.addAttribute("logs",logService.showLog());
        return "logList";
    }
    @RequestMapping(path = "/TochangeRemark")
    public String TochangeRemark( String logid, String remark,Model model){
        model.addAttribute("logid",logid);
        model.addAttribute("remark",remark);
        System.out.println(logid+","+remark);
        return "changeRemark";
    }

    @RequestMapping(path = "/changeRemark")
    public String changeRemark(String logid,String remark){
        logService.changeRemark(logid,remark);
        return "redirect:/toLogList";
    }



}
