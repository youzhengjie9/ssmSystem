package com.dao;

import com.pojo.luckdraw;

import java.util.List;

public interface luckdrawMapper {
    /**
     * 抽签Mapper
     */
    void addDraw(luckdraw luckdraw);

    List<luckdraw> queryAllDraw();


}
