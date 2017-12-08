package com.yjg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yjg.entity.WxUser;
@Repository
public interface WxUserMapper {
    
    /**
     * 根據起始行查詢7個微信用戶
     * @param row
     * @return List<WxUser>
     */
    List<WxUser> selectAllWxUser(@Param("row") int row) throws Exception;
    
    /**
     * 查詢微信用戶個數
     * @return int
     */
    int selectAllWxUserCount() throws Exception;
    
    /**
     * 根據單個id查詢單個微信用戶
     * @param id 
     * @return WxUser
     */
    WxUser selectWxUserById(int id) throws Exception;
    
    /**
     * 根據openid和phone查詢微信用戶個數
     * @param openid 微信用户openid
     * @param phone 手機號碼
     */
    int selectWxUserByOpenidOrPhone(@Param("openid") String openid, @Param("phone") String phone) throws Exception;
       
    /**
     * 根據id刪除單個微信用戶
     * @param id 微信用户id
     */
    void deleteWxUserById(int id) throws Exception;
    
    /**
     * 根據多個id刪除多個對應的微信用戶
     * @param id 微信用户id
     */
    void deleteWxUserByIds(@Param("id") int[] id) throws Exception;
    
    /**
     * 添加單個用戶
     * @param openid 微信用户openid
     * @param phone 手機號碼
     */
    void insertWxUser(@Param("openid") String openid,@Param("phone") String phone) throws Exception;
}
