package com.yjg.service;

import com.yjg.vo.OrderAndWxUser;

import java.util.List;

/**
 * Created by Administrator on 2017/12/23.
 */
public interface OrderAndWxUserService {
    List<OrderAndWxUser>  listOW(Integer id);
    OrderAndWxUser ByOWId(Integer id);
}
