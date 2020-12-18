package com.service;

import com.pojo.emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface empService {

    List<emp> queryAllEmp();

    void addEmp(emp emp);

    void delEmp(String empid);

    void changeEmp(emp emp);

    String queryEmpAdminID(String empid);

    void delEmpByAdminID(String adminID);
}
