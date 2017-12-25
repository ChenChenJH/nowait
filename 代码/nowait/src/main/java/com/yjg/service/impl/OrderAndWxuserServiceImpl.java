package com.yjg.service.impl;

import com.yjg.mapper.OrderAndWxUderMapper;
import com.yjg.service.OrderAndWxUserService;
import com.yjg.vo.OrderAndWxUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/23.
 */
@Service
public class OrderAndWxuserServiceImpl implements OrderAndWxUserService{
    @Autowired
    private OrderAndWxUderMapper orderAndWxUderMapper;
    @Override
    public List<OrderAndWxUser> listOW(Integer id) {
        return orderAndWxUderMapper.listOWById(id);
    }

    @Override
    public OrderAndWxUser ByOWId(Integer id) {
        return orderAndWxUderMapper.ByOWId(id);
    }
}
