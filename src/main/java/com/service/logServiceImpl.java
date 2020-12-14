package com.service;

import com.dao.logMapper;
import com.pojo.logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class logServiceImpl implements logService {

    private logMapper logMapper;

    @Autowired
    public void setLogMapper(com.dao.logMapper logMapper) {
        this.logMapper = logMapper;
    }

    @Override
    public void addLog(logger logger) {

        logMapper.addLog(logger);
    }

    @Override
    public List<logger> showLog() {
        return logMapper.showLog();
    }

    @Override
    public void changeRemark(String logid, String remark) {
        logMapper.changeRemark(logid,remark);
    }
}
