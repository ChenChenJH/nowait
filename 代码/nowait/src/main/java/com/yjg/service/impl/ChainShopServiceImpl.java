package com.yjg.service.impl;

import com.yjg.entity.ChainShop;
import com.yjg.mapper.ChainShopMapper;
import com.yjg.service.ChainShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
@Service
public class ChainShopServiceImpl implements ChainShopService {
    @Autowired
    private ChainShopMapper chainShopMapper;
    @Override
    public List<ChainShop> chainShopList() {
        return chainShopMapper.chainShopList();
    }
}
