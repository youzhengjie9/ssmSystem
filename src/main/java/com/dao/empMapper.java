package com.dao;

import com.pojo.emp;

import java.util.List;

public interface empMapper {


    List<emp> queryAllEmp();

    void addEmp(emp emp);

    void delEmp(String empid);

    void changeEmp(emp emp);



}
