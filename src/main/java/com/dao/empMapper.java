package com.dao;

import com.pojo.emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface empMapper {


    List<emp> queryAllEmp();

    void addEmp(emp emp);

    void delEmp(String empid);

    void delEmpByAdminID(@Param("adminID") String adminID);

    void changeEmp(emp emp);

    String queryEmpAdminID(@Param("empid") String empid);



}
