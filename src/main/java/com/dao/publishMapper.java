package com.dao;

import com.pojo.publish;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface publishMapper {


    void addPublish(publish publish);

    List<publish> queryPublish();

    String queryAdminByid(@Param("sid") String sid);  //根据签到id去获取发布管理员id


}
