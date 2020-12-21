package com.controller;

import com.jedis.myJedis;
import com.pojo.emp;
import com.pojo.logger;
import com.pojo.publish;
import com.pojo.sign;
import com.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class SigninController {
    private myJedis myJedis;
    private publishService publishService;
    private signService signService;
    private deptService deptService;
    private empService empService;
    private logService logService;

    @Autowired
    public void setLogService(com.service.logService logService) {
        this.logService = logService;
    }

    @Autowired
    public void setEmpService(com.service.empService empService) {
        this.empService = empService;
    }

    @Autowired
    public void setDeptService(com.service.deptService deptService) {
        this.deptService = deptService;
    }

    @Autowired
    public void setSignService(com.service.signService signService) {
        this.signService = signService;
    }

    @Autowired
    public void setPublishService(com.service.publishService publishService) {
        this.publishService = publishService;
    }

    @Autowired
    public void setMyJedis(com.jedis.myJedis myJedis) {
        this.myJedis = myJedis;
    }


    @RequestMapping(path = "/toPublishList")
    public String toPublishList(Model model){

        model.addAttribute("publishs",publishService.queryPublish());
        model.addAttribute("depts",deptService.queryAllDept());
        model.addAttribute("curTime",new Date().getTime());
        Subject subject = SecurityUtils.getSubject();
        model.addAttribute("user",subject.getPrincipal());


        return "publishList";
    }
    //抽取日志方法
    public  void addlog(HttpServletRequest request, String type){
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


    //发布签到
    @RequestMapping(path = "/publish")
    public String publish(HttpServletRequest request,String time, @Value("发布签到") String type, String dept){
        try {
            Jedis jedis = myJedis.getJedis();
            Subject subject = SecurityUtils.getSubject();
            String signKey="sign"+subject.getPrincipal();
            //首先判断是否已经发布签到
            String s = jedis.get(signKey);
            if(s==null||s.equals("")){
                /**
                 *需要优化，目前只做一个用户只能发一个签到
                 */
                int m = Integer.parseInt(time);
                int second=m*60;
                jedis.setex(signKey,second,"sign");
                String sid = UUID.randomUUID().toString().replaceAll("-", "");
                String id= (String) SecurityUtils.getSubject().getPrincipal();
                Date d = new Date();
//                java.sql.Date date=(java.sql.Date)d;
                long start = d.getTime(); //开始的时间======转换成长整数
                SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String dateTime = format.format(d);



                //结束时间
                long e = Long.parseLong(time);
                long end=e*60000; //结束时间毫秒
                long curEnd=start+end;
                java.sql.Date date1 = new java.sql.Date(start + end);  //结束时间

                String endTime = format.format(date1);

                if(dept==null||dept.equals("")){
                    //发布给所有员工签到
                    List<emp> emps = empService.queryAllEmp();
                    publishService.addPublish(new publish(sid,id,dateTime,endTime,"所有部门"));
                    for (emp emp : emps) {
                        signService.addSign(new sign(sid,emp.getEmpid(),endTime,0));
                    }
                    System.out.println("给所有部门员工发布签到成功！！");

                    String logid = UUID.randomUUID().toString().replaceAll("-", "");
                     addlog(request,type);

                }else{
                    //发布给指定部门员工签到
                    String deptName = deptService.queryDeptName(dept);
                    publishService.addPublish(new publish(sid,id,dateTime,endTime,deptName));

                    List<emp> emps = empService.queryEmpByDept(dept);
                    for (emp emp : emps) {
                        signService.addSign(new sign(sid,emp.getEmpid(),endTime,0));
                    }
                    System.out.println("给指定部门员工发布签到成功！！");
                    addlog(request,type);
                }


                return "list";
            }else{
                System.out.println("已经发布过了，请等待签到时间过了再重新发布");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return "list";
        }


        return "list";
    }

    @RequestMapping(path = "/toSignList")
    public String toSignList(Model model){

        Subject subject = SecurityUtils.getSubject();
        String id = (String) subject.getPrincipal();
        String empid = empService.queryEmpByID(id);


        List<sign> signs = signService.querySign(empid); //根据empid查询出所有签到记录
        model.addAttribute("signs",signs);
        model.addAttribute("user",subject.getPrincipal());
        return "signList";
    }


    /**
     * 签到（sign）表，自动增长的值，发布签到的编号，员工id，结束时间，是否签到
     * 当员工在当前的date大于结束时间的date签到时，签到失败。
     * 当签到发布后，通过遍历emp员工，为符合条件的员工插入签到记录，默认为0，签到成功改成1
     *
     *
     */


    //签到
    @RequestMapping(path = "/sign/{sid}")
    public String signIn(@PathVariable("sid") String sid){
        Jedis jedis = myJedis.getJedis();

//        Subject subject = SecurityUtils.getSubject();
//        String signKey="sign"+subject.getPrincipal();

//        获取签到发布者id
        String adminid = publishService.queryAdminByid(sid);
        String signKey="sign"+adminid;



        String s = jedis.get(signKey); //判断签到是否过期
        if(s==null){
            System.out.println("签到时间已经过了。");
            return "list";
        }else {
            //签到
            Subject subject = SecurityUtils.getSubject();
            String id = (String) subject.getPrincipal();
            String empid = empService.queryEmpByID(id);
            signService.SignSuccess(sid,empid);
            System.out.println("签到成功！！！");
        }

        return "list";
    }






}
