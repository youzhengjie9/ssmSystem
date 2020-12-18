package com.service;

import com.dao.empMapper;
import com.pojo.emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class empServiceImpl implements empService {

    private empMapper empMapper;
    @Autowired
    public void setEmpMapper(com.dao.empMapper empMapper) {
        this.empMapper = empMapper;
    }

    @Override
    public List<emp> queryAllEmp() {
        return empMapper.queryAllEmp();
    }

    @Override
    public void addEmp(emp emp) {
        empMapper.addEmp(emp);
    }

    @Override
    public void delEmp(String empid) {
        empMapper.delEmp(empid);

    }

    @Override
    public void changeEmp(emp emp) {
        empMapper.changeEmp(emp);
    }

    @Override
    public String queryEmpAdminID(String empid) {
        return empMapper.queryEmpAdminID(empid);
    }

    @Override
    public void delEmpByAdminID(String adminID) {
        empMapper.delEmpByAdminID(adminID);
    }
}
