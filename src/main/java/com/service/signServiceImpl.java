package com.service;

import com.dao.signMapper;
import com.pojo.sign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class signServiceImpl implements signService {

    private signMapper signMapper;

    @Autowired
    public void setSignMapper(com.dao.signMapper signMapper) {
        this.signMapper = signMapper;
    }

    @Override
    public void addSign(sign sign) {

        signMapper.addSign(sign);
    }

    @Override
    public List<sign> querySign(String empid) {
        return signMapper.querySign(empid);
    }

    @Override
    public void SignSuccess(String sid, String empid) {
        signMapper.SignSuccess(sid,empid);
    }
}
