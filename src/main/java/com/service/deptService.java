package com.service;

import com.pojo.dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface deptService {


    List<dept> queryAllDept();

    String queryDeptName(String deptid);

    void addDept(dept dept);

    void delDept(String deptid);

    void changeDept(dept dept);
}
