package com.service;

import com.dao.authorityMapper;
import com.pojo.authority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class authorityServiceImpl implements authorityService{

    private authorityMapper authorityMapper;

    @Autowired
    public void setAuthorityMapper(com.dao.authorityMapper authorityMapper) {
        this.authorityMapper = authorityMapper;
    }

    @Override
    public List<authority> queryAllAutho() {
        return authorityMapper.queryAllAutho();
    }
}
