package com.yjg.vo;

import com.yjg.entity.Restaurant;
import com.yjg.entity.User;

import java.util.List;

/**
 * Created by ljh on 2017/12/12.
 */
public class RestaurantAndUser extends Restaurant {

    private String UserTureName;

    public String getUserTureName() {
        return UserTureName;
    }

    public void setUserTureName(String userTureName) {
        UserTureName = userTureName;
    }
}
