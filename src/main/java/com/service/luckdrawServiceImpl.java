package com.service;

import com.dao.luckdrawMapper;
import com.pojo.luckdraw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class luckdrawServiceImpl implements luckdrawService {
    private luckdrawMapper luckdrawMapper;

    @Autowired
    public void setLuckdrawMapper(com.dao.luckdrawMapper luckdrawMapper) {
        this.luckdrawMapper = luckdrawMapper;
    }

    @Override
    public void addDraw(luckdraw luckdraw) {
        luckdrawMapper.addDraw(luckdraw);
    }

    @Override
    public List<luckdraw> queryAllDraw() {
        return luckdrawMapper.queryAllDraw();
    }
}
