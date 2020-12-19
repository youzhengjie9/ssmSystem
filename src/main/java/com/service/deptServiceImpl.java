package com.service;

import com.dao.deptMapper;
import com.pojo.dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class deptServiceImpl implements deptService {

    private deptMapper deptMapper;
    @Autowired
    public void setDeptMapper(com.dao.deptMapper deptMapper) {
        this.deptMapper = deptMapper;
    }

    @Override
    public List<dept> queryAllDept() {
        return deptMapper.queryAllDept();
    }

    @Override
    public String queryDeptName(String deptid) {
        return deptMapper.queryDeptName(deptid);
    }

    @Override
    public void addDept(dept dept) {
        deptMapper.addDept(dept);
    }

    @Override
    public void delDept(String deptid) {
        deptMapper.delDept(deptid);
    }

    @Override
    public void changeDept(dept dept) {
        deptMapper.changeDept(dept);
    }


}
