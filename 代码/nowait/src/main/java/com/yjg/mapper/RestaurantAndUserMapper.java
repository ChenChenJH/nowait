package com.yjg.mapper;


import java.util.List;

import com.yjg.vo.RestaurantAndUser;

/**
 * Created by ljh on 2017/12/5.
 */
public interface RestaurantAndUserMapper {

    List<RestaurantAndUser> listRU();
    List<RestaurantAndUser> listRuById(Integer id);
    RestaurantAndUser listByRsId(Integer id);

}
