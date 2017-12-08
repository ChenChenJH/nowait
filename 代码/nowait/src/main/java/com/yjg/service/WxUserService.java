package com.yjg.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjg.entity.WxUser;


public interface WxUserService {
    
    /**
     * 根據起始行獲得7個微信用戶
     * @param row
     * @return List<WxUser>
     */
    List<WxUser> getAllWxUser(int row) throws Exception;
    
    /**
     * 獲取微信用戶個數
     * @return int
     */
    int getAllWxUserCount() throws Exception;
    
    /**
     * 根據id獲取微信用戶
     * @param id
     * @return WxUser
     */
    WxUser getWxUserById(int id) throws Exception;
    
    /**
     * 根據openid和phone獲取微信用戶個數
     * @param openid 微信用戶openid
     * @param phone 手機號碼
     */
    int getWxUserByOpenidOrPhone(String openid, String phone) throws Exception;
    
    /**
     * 根據id刪除單個微信用戶
     * @param id 微信用戶id
     */
    void deleteWxUserById(int id) throws Exception;
    
    /**
     * 根據多個id刪除多個對應的微信用戶
     * @param id 微信用戶id
     */
    void deleteWxUserByIds(int[] id) throws Exception;
    
    /**
     * 添加單個用戶
     * @param openid 微信用戶openid
     * @param phone 用戶手機號碼
     */
    void insertWxUser(@Param("openid") String openid,@Param("phone") String phone) throws Exception;
}
