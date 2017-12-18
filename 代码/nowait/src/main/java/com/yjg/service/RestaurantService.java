package com.yjg.service;

import com.yjg.entity.Restaurant;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
public interface RestaurantService{

    public void addRestaurant(Restaurant restaurant) throws Exception;

    List<Restaurant> queryRestaurantList() throws Exception;

    List<Restaurant> queryRestaurantByUserId(int id) throws Exception;

    Restaurant queryRestaurantById(int id);

    void deleteRestaurant(int id);

    void update(Restaurant restaurant);
}
