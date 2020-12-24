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

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

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
        return "redirect:/toLogList/1";
    }


    //日志文件导出
    @RequestMapping(path = "/export")
    public String export(HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("logger");
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        String logpath=path+"\\log_"+name+".log";
        File logfile = new File(logpath);
        File dir = new File(path);
        if(!dir.exists()||!dir.isDirectory()){
            dir.mkdir();
        }
        if(!logfile.exists()){
            logfile.createNewFile();
        }
//        设置FileOutputStream可以追加为true==> FileOutputStream(logfile,true)
        BufferedOutputStream bufferedOutputStream=new BufferedOutputStream(new FileOutputStream(logfile,true));
        List<logger> loggers = logService.showLog();
        for (int i = 0; i < loggers.size(); i++) {
            String str="日志编号:"+loggers.get(i).getLogid()+"       用户id:"+loggers.get(i).getId()+"      操作类型:"+loggers.get(i).getType()+"     内容: "+loggers.get(i).getOperation()
                    +"      时间:"+loggers.get(i).getDate()+"      备注:"+loggers.get(i).getRemark();
            bufferedOutputStream.write(str.getBytes());
            String br="\r\n";
            bufferedOutputStream.write(br.getBytes());
        }
        bufferedOutputStream.flush();
        bufferedOutputStream.close();


        return "redirect:/toLogList/1";
    }



}
