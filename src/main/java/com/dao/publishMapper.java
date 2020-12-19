package com.dao;

import com.pojo.publish;

import java.util.List;

public interface publishMapper {


    void addPublish(publish publish);

    List<publish> queryPublish();

}
