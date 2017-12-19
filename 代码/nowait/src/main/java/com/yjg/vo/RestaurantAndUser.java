package com.yjg.vo;

import com.yjg.entity.Restaurant;

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
