package com.dao;

import com.pojo.sign;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface signMapper {


    //发布签到就把员工签到信息添加到sign表中
    void addSign(sign sign);

    List<sign> querySign(String empid); //查询我的签到

    //签到成功
    void SignSuccess(@Param("sid") String sid,@Param("empid") String empid);



}
