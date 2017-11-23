package com.yjg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yjg.entity.WxUser;
import com.yjg.mapper.WxUserMapper;
import com.yjg.service.WxUserService;

@Service
public class WxUserServiceImpl implements WxUserService {

    @Resource
    private WxUserMapper wxUserMapper;
    
    /**
     * 获取所有微信用户
     * @return List<WxUser>
     */
    public List<WxUser> getAllWxUser() {
        // TODO Auto-generated method stub
        return wxUserMapper.selectAllWxUser();
    }

    /**
     * 根据id获取微信用户
     * @param id
     * @return WxUser
     */
    public WxUser getWxUserById(int id) {
        // TODO Auto-generated method stub
        return wxUserMapper.selectWxUserById(id);
    }

    /**
     * 根据微信用户id删除微信用户
     * @param openid
     */
    public void deleteWxUserById(int id) {
        // TODO Auto-generated method stub
        wxUserMapper.deleteWxUserById(id);
    }

    /**
     * 根据多个id删除多个对应的微信用户
     * @param id 微信用户id
     */
    public void deleteWxUserByIds(int[] id) {
        // TODO Auto-generated method stub
        wxUserMapper.deleteWxUserByIds(id);
    }

    public void insertWxUser(String openid, String phone) {
        // TODO Auto-generated method stub
        wxUserMapper.insertWxUser(openid, phone);
    }

    /**
     * 根据openid和phone获取微信用户个数
     * @param openid 微信用户openid
     * @param phone 手机号码
     */
    public int getWxUserByOpenidOrPhone(String openid, String phone) {
        // TODO Auto-generated method stub
        int n = 0;
        try{
            n = wxUserMapper.selectWxUserByOpenidOrPhone(openid, phone);
        }catch(Exception e){
            //查询为空
        }
        return n;
    }

}
