package com.yjg.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjg.entity.WxUser;


public interface WxUserService {
    
    /**
     * 获取所有微信用户
     * @return List<WxUser>
     */
    List<WxUser> getAllWxUser();
    
    /**
     * 根据id获取微信用户
     * @param id
     * @return WxUser
     */
    WxUser getWxUserById(int id);
    
    /**
     * 根据openid和phone获取微信用户个数
     * @param openid 微信用户openid
     * @param phone 手机号码
     */
    int getWxUserByOpenidOrPhone(String openid, String phone);
    
    /**
     * 根据id删除单个微信用户
     * @param id 微信用户id
     */
    void deleteWxUserById(int id);
    
    /**
     * 根据多个id删除多个对应的微信用户
     * @param id 微信用户id
     */
    void deleteWxUserByIds(int[] id);
    
    /**
     * 添加单个用户
     * @param openid 微信用户openid
     * @param phone 用户手机号码
     */
    void insertWxUser(@Param("openid") String openid,@Param("phone") String phone);
}
