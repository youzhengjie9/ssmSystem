package com.service;

import com.pojo.emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface empService {

    List<emp> queryAllEmp();

    //筛选指定部门的员工
    List<emp> queryEmpByDept(String deptid);

    //根据帐号查询出empid
    String queryEmpByID(@Param("id") String id);

    void addEmp(emp emp);

    void delEmp(String empid);

    void changeEmp(emp emp);

    String queryEmpAdminID(String empid);

    void delEmpByAdminID(String adminID);

    String queryEmpNameByEmpid(int empid);

    String queryDeptidByEmpid(@Param("empid") int empid);
}
