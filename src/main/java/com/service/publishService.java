package com.service;

import com.pojo.publish;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface publishService {


    void addPublish(publish publish); //将发布的信息添加在publish表中

    List<publish> queryPublish();

    String queryAdminByid(String sid);  //根据签到id去获取发布管理员id

}
