package com.yjg.mapper;

import com.yjg.entity.Restaurant;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
public interface RestaurantMapper {

	// 添加餐厅信息
	public int insert(Restaurant restaurant) throws Exception;

	public List<Restaurant> listAll() throws Exception;

	public List<Restaurant> listAllByUserId(int id) throws Exception;

	public Restaurant queryRestaurantById(int id);

	public void deleteById(int id);

	void update(Restaurant restaurant);
}
