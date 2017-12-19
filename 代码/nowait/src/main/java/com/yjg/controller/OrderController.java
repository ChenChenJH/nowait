package com.yjg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yjg.entity.Order;
import com.yjg.service.OrderService;

/**
 * Created by ljh on 2017/11/21.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    //接受页面传递的id值

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    //根据餐厅id查询该店所有的订单
    @RequestMapping("/queryOrderList")
    @ResponseBody
    public ModelAndView queryOrderList(HttpServletRequest request){

        //从request中获取请求值
        String sid=request.getParameter("id");
        Integer id=Integer.valueOf(sid);
        //根据id查询所有订单
        List<Order> orderList=orderService.queryOrderAll(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("orderList",orderList);
        modelAndView.setViewName("/mainFrame/restaurantManager/orderList.jsp");
        return modelAndView;

    }
    //根据id查询订单
    @RequestMapping("/queryOrderById")
    @ResponseBody
    public ModelAndView queryOrderById(HttpServletRequest request){

        //从request中获取请求值
        String sid=request.getParameter("id");
        Integer id=Integer.valueOf(sid);
        //根据id查询所有订单
        Order order=orderService.queryOrderById(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("order",order);
        modelAndView.setViewName("/mainFrame/restaurantManager/orderDetail.jsp");
        return modelAndView;

    }
    //根据id删除订单
    @RequestMapping("/delete")
    public void deleteOrder(HttpServletRequest request, HttpServletResponse response){
        //从request中获取请求值
        String sid=request.getParameter("id");
        Integer id=Integer.valueOf(sid);
        orderService.deleteOrder(id);


    }
}
