package com.yjg.service.impl;

import com.yjg.entity.Restaurant;
import com.yjg.mapper.DeskMapper;
import com.yjg.mapper.OrderMapper;
import com.yjg.mapper.RestaurantMapper;
import com.yjg.service.RestaurantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    private  RestaurantMapper restaurantMapper;
    
    @Autowired
    private OrderMapper orderMapper;
    
    @Autowired
    private DeskMapper deskMapper;
    
    @Override
    public void addRestaurant(Restaurant restaurant) throws Exception {

        restaurantMapper.insert(restaurant);

    }

    @Override
    public List<Restaurant> queryRestaurantList() throws Exception {
        List<Restaurant> list= restaurantMapper.listAll();
        return list;
    }

    @Override
    public List<Restaurant> queryRestaurantByUserId(int id) throws Exception  {
        List<Restaurant> list=restaurantMapper.listAllByUserId(id);
        return list;
    }

    @Override
    public Restaurant queryRestaurantById(int id) {
        Restaurant restaurant=restaurantMapper.queryRestaurantById(id);
        return restaurant;
    }

    @Override
    public void deleteRestaurant(int id) {
    	//按餐厅id删掉对应的排队单
    	orderMapper.deleteByRestId(id);
    	//按餐厅id删掉对应的桌子
    	deskMapper.deleteByRestId(id);
        restaurantMapper.deleteById(id);
    }

    @Override
    public void update(Restaurant restaurant) {
        restaurantMapper.update(restaurant);
    }
}
