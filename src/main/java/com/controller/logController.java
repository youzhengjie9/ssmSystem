package com.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.logger;
import com.service.logService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;

@Controller
public class logController {
    private logService logService;

    @Autowired
    public void setLogService(com.service.logService logService) {
        this.logService = logService;
    }

    @RequestMapping(path = "/toLogList/{num}")
    public String toLogList(@PathVariable("num") int num, Model model){
        PageHelper.startPage(num,5);//开始分页。
        List<logger> loggers = logService.showLog();

        PageInfo pageInfo=new PageInfo(loggers);
//        System.out.println("PageNum:"+pageInfo.getPageNum());
//        System.out.println("Pages:"+pageInfo.getPages());
//        System.out.println("total:"+pageInfo.getTotal());
//        System.out.println("NavigatePages:"+pageInfo.getNavigatePages());
//        System.out.println("NavigatePageNums:"+Arrays.toString(pageInfo.getNavigatepageNums()));
//        System.out.println("PageSize:"+pageInfo.getPageSize());
//        System.out.println("list:"+pageInfo.getList());
//        System.out.println("prePage:"+pageInfo.getPrePage());
//        System.out.println("NextPage:"+pageInfo.getNextPage());
//        System.out.println("lastPage:"+pageInfo.getLastPage());


        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("logs",loggers);
        Subject subject = SecurityUtils.getSubject();
        model.addAttribute("user",subject.getPrincipal());
        return "logList";
    }


    @RequestMapping(path = "/changeRemark")
    public String changeRemark(String logid,String remark){
        logService.changeRemark(logid,remark);
        return "redirect:/toLogList";
    }



}
