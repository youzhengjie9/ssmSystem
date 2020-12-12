package com.service;

import com.pojo.dept;

import java.util.List;

public interface deptService {


    List<dept> queryAllDept();

    void addDept(dept dept);

    void delDept(String deptid);

    void changeDept(dept dept);
}
