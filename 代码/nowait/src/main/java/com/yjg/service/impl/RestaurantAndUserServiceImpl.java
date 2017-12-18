package com.yjg.service.impl;


import com.yjg.mapper.RestaurantAndUserMapper;
import com.yjg.service.RestaurantAndUserService;
import com.yjg.vo.RestaurantAndUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ljh on 2017/12/14.
 */
@Service
public class RestaurantAndUserServiceImpl implements RestaurantAndUserService {
    @Autowired
    private RestaurantAndUserMapper restaurantAndUserMapper;
    @Override
    public List<RestaurantAndUser> listRU() {
        List<RestaurantAndUser> list=restaurantAndUserMapper.listRU();
        return list;
    }

    @Override
    public List<RestaurantAndUser> listRuById(Integer id) {
        List<RestaurantAndUser> list=restaurantAndUserMapper.listRuById(id);
        return list;
    }

    @Override
    public RestaurantAndUser listByRsId(Integer id) {
        RestaurantAndUser list=restaurantAndUserMapper.listByRsId(id);
        return list;
    }
}
