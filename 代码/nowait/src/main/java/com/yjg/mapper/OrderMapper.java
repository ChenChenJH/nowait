package com.yjg.mapper;

import com.yjg.entity.Order;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
public interface OrderMapper {
    public List<Order> orderList(int id);
    public Order orderById(int id);
    public void deleteOrder(int id);
}
