package com.yjg.entity;

/**
 * Created by ljh on 2017/11/23.
 */
public class QueryPojo {
    private Integer[] ids;


    private Restaurant item;

    public Restaurant getItem() {
        return item;
    }

    public void setItem(Restaurant item) {
        this.item = item;
    }

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

}
