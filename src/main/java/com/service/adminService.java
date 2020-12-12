package com.service;

import com.pojo.admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface adminService {


    List<admin> queryAllAdmin();

    admin queryOneAdmin(String id);

    void changeAdmin(admin admin);

    void addAdmin(admin admin);

    void delAdmin(String id);
}
