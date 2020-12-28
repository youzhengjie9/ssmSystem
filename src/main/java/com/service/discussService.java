package com.service;

import com.pojo.discuss;

import java.util.List;

public interface discussService {


    void addDiscuss(discuss discuss);


    List<discuss> queryAllDiscuss();
}
