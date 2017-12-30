package com.yjg.service;

import com.yjg.vo.RestaurantAndUser;

import java.util.List;

/**
 * Created by ljh on 2017/12/14.
 */
public interface RestaurantAndUserService {
	List<RestaurantAndUser> listRU();

	List<RestaurantAndUser> listRuById(Integer id);

	RestaurantAndUser listByRsId(Integer id);
}
