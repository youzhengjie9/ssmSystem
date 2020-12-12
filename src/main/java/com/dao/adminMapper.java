package com.dao;

import com.pojo.admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface adminMapper {


    List<admin> queryAllAdmin();

    admin queryOneAdmin(@Param("id") String id);

    void changeAdmin(admin admin); //修改权限

    void addAdmin(admin admin);

    void delAdmin(String id);

}
