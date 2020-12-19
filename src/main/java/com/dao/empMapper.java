package com.dao;

import com.pojo.emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface empMapper {


    List<emp> queryAllEmp();

    //筛选指定部门的员工
    List<emp> queryEmpByDept(@Param("deptid") String deptid);

    //根据帐号查询出empid
    String queryEmpByID(@Param("id") String id);

    void addEmp(emp emp);

    void delEmp(String empid);

    void delEmpByAdminID(@Param("adminID") String adminID);

    void changeEmp(emp emp);

    String queryEmpAdminID(@Param("empid") String empid);



}
