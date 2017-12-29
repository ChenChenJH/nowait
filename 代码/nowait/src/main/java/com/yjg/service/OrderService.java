package com.yjg.service;

import com.yjg.entity.Order;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
public interface OrderService {
	List<Order> queryOrderAll(int id);

	Order queryOrderById(int id);

}
