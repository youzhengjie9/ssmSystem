package com.service;

import com.pojo.discuss;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface discussService {


    void addDiscuss(discuss discuss);


    List<discuss> queryAllDiscuss();

    discuss queryDiscussByID(String discussid);
}
