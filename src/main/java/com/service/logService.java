package com.service;

import com.pojo.logger;

import java.util.List;

public interface logService {


    //添加日志
    void addLog(logger logger);

    //展示日志
    List<logger> showLog();

    //添加/修改备注
    void changeRemark( String logid, String remark);
}
