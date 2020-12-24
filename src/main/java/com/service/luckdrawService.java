package com.service;

import com.pojo.luckdraw;

import java.util.List;

public interface luckdrawService {



    void addDraw(luckdraw luckdraw);

    List<luckdraw> queryAllDraw();

}
