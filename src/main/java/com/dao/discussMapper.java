package com.dao;

import com.pojo.discuss;

import java.util.List;

public interface discussMapper {


    void addDiscuss(discuss discuss);


    List<discuss> queryAllDiscuss();



}
