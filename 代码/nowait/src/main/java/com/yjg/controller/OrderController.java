package com.yjg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjg.service.OrderAndWxUserService;
import com.yjg.vo.OrderAndWxUser;


/**
 * Created by ljh on 2017/11/21.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderAndWxUserService orderAndWxUserService;



    //根据餐厅id查询该店所有的订单
    @RequestMapping("/queryOrderList")
    @ResponseBody
    public ModelAndView queryOrderList(Integer restid,@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request){

        //根据id查询所有订单
        PageHelper.startPage(page,10);
        List<OrderAndWxUser> orderList=orderAndWxUserService.listOW(restid);
        PageInfo<OrderAndWxUser> p=new PageInfo<OrderAndWxUser>(orderList);

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("orderList",orderList);
        modelAndView.addObject("page",p);
        modelAndView.setViewName("/mainFrame/restaurantManager/orderList.jsp");
        return modelAndView;

    }
    //根据id查询订单
    @RequestMapping("/queryOrderById")
    @ResponseBody
    public ModelAndView queryOrderById(Integer id,HttpServletRequest request){

        //根据id查询所有订单
        OrderAndWxUser order=orderAndWxUserService.ByOWId(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("order",order);
        modelAndView.setViewName("/mainFrame/restaurantManager/orderDetail.jsp");
        return modelAndView;

    }
}
