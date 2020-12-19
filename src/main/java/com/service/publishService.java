package com.service;

import com.pojo.publish;

import java.util.List;

public interface publishService {


    void addPublish(publish publish); //将发布的信息添加在publish表中

    List<publish> queryPublish();

}
