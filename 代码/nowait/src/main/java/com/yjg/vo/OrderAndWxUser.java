package com.yjg.vo;

import com.yjg.entity.Order;

/**
 * Created by Administrator on 2017/12/23.
 */
public class OrderAndWxUser extends Order {
    private String openId;

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }
}
