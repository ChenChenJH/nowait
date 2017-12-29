package com.yjg.service.impl;

import com.yjg.entity.Order;
import com.yjg.mapper.OrderMapper;
import com.yjg.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public List<Order> queryOrderAll(int id) {
        List<Order> orderList=orderMapper.orderList(id);
        return  orderList;
    }

    @Override
    public Order queryOrderById(int id) {
        Order order=orderMapper.orderById(id);
        return  order;
    }

}
