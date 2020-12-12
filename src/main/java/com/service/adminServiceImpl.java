package com.service;

import com.dao.adminMapper;
import com.pojo.admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class adminServiceImpl implements adminService {

    private adminMapper adminMapper;

    @Autowired
    @Qualifier("adminMapper")
    public void setAdminMapper(com.dao.adminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public List<admin> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }

    @Override
    public admin queryOneAdmin(String id) {
        return adminMapper.queryOneAdmin(id);
    }

    @Override
    public void changeAdmin(admin admin) {
        adminMapper.changeAdmin(admin);
    }

    @Override
    public void addAdmin(admin admin) {
        adminMapper.addAdmin(admin);
    }

    @Override
    public void delAdmin(String id) {
        adminMapper.delAdmin(id);
    }
}
