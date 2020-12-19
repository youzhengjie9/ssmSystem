package com.service;

import com.dao.publishMapper;
import com.pojo.publish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class publishServiceImpl implements publishService {

    private publishMapper publishMapper;

    @Autowired
    public void setPublishMapper(com.dao.publishMapper publishMapper) {
        this.publishMapper = publishMapper;
    }

    @Override
    public void addPublish(publish publish) {

        publishMapper.addPublish(publish);
    }

    @Override
    public List<publish> queryPublish() {
        return publishMapper.queryPublish();
    }
}
