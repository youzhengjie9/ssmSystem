package com.service;

import com.dao.discussMapper;
import com.pojo.discuss;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class discussServiceImpl implements discussService {

    private discussMapper discussMapper;
    @Autowired
    public void setDiscussMapper(com.dao.discussMapper discussMapper) {
        this.discussMapper = discussMapper;
    }

    @Override
    public void addDiscuss(discuss discuss) {
        discussMapper.addDiscuss(discuss);
    }

    @Override
    public List<discuss> queryAllDiscuss() {
        return discussMapper.queryAllDiscuss();
    }
}
