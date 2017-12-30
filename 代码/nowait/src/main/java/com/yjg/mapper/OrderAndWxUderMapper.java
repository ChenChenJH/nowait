package com.yjg.mapper;

import com.yjg.vo.OrderAndWxUser;

import java.util.List;

/**
 * Created by Administrator on 2017/12/23.
 */
public interface OrderAndWxUderMapper {
	List<OrderAndWxUser> listOW();

	List<OrderAndWxUser> listOWById(Integer id);

	OrderAndWxUser ByOWId(Integer id);
}
