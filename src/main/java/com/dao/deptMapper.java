package com.dao;

import com.pojo.dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface deptMapper {

    List<dept> queryAllDept();

    String queryDeptName(@Param("deptid") String deptid);

    void addDept(dept dept);


    void delDept(String deptid);

    void changeDept(dept dept);

}
