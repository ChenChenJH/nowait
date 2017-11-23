package com.yjg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yjg.entity.WxUser;
@Repository
public interface WxUserMapper {
    /**
     * 查询所有微信用户
     * @return List<WxUser>
     */
    List<WxUser> selectAllWxUser();
    
    /**
     * 根据单个id查询单个微信用户
     * @param id 微信用户id
     * @return WxUser
     */
    WxUser selectWxUserById(int id);
    
    /**
     * 根据openid和phone查询微信用户个数
     * @param openid 微信用户openid
     * @param phone 手机号码
     */
    int selectWxUserByOpenidOrPhone(@Param("openid") String openid, @Param("phone") String phone);
       
    /**
     * 根据id删除单个微信用户
     * @param id 微信用户id
     */
    void deleteWxUserById(int id);
    
    /**
     * 根据多个id删除多个对应的微信用户
     * @param id 微信用户id
     */
    void deleteWxUserByIds(@Param("id") int[] id);
    
    /**
     * 添加单个用户
     * @param openid 微信用户openid
     * @param phone 用户手机号码
     */
    void insertWxUser(@Param("openid") String openid,@Param("phone") String phone);
}
