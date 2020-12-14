package com.dao;

import com.pojo.logger;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface logMapper {

    //添加日志
    void addLog(logger logger);

    //展示日志
    List<logger> showLog();

    //添加/修改备注
    void changeRemark(@Param("logid") String logid,@Param("remark") String remark);


}
