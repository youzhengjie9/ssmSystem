package com.dao;

import com.pojo.discuss;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface discussMapper {


    void addDiscuss(discuss discuss);


    List<discuss> queryAllDiscuss();


    discuss queryDiscussByID(@Param("discussid") String discussid);

}
