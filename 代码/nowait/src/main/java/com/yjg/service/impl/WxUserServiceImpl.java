package com.yjg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yjg.entity.WxUser;
import com.yjg.mapper.FeedbackMapper;
import com.yjg.mapper.WxUserMapper;
import com.yjg.service.WxUserService;

@Service
public class WxUserServiceImpl implements WxUserService {

    @Resource
    private WxUserMapper wxUserMapper;
    
    @Resource
    private FeedbackMapper feedbackMapper;
    
    /**
     * 根據起始行獲得7個微信用戶
     * @param row
     * @return List<WxUser>
     */
    public List<WxUser> getAllWxUser(int row) throws Exception{
        // TODO Auto-generated method stub
        return wxUserMapper.selectAllWxUser(row);
    }
    
    /**
     * 獲取微信用戶個數
     * @return int
     */
    public int getAllWxUserCount() throws Exception{
        // TODO Auto-generated method stub
        int n = 0;
        try{
            n = wxUserMapper.selectAllWxUserCount();
        }catch(Exception e){
            //查詢爲空
        }
        return n;
    }

    /**
     * 根據id獲取微信用戶
     * @param id
     * @return WxUser
     */
    public WxUser getWxUserById(int id) throws Exception{
        // TODO Auto-generated method stub
        return wxUserMapper.selectWxUserById(id);
    }

    /**
     * 根據微信用戶id刪除微信用戶
     * @param openid
     */
    public void deleteWxUserById(int id) throws Exception{
        //同时也删除该微信用户对应的反馈信息
    	feedbackMapper.deleteFeedbackByWxuserId(id);
        wxUserMapper.deleteWxUserById(id);
    }

    /**
     * 根據多個id刪除多個對應的微信用戶
     * @param id 微信用戶id
     */
    public void deleteWxUserByIds(int[] id) throws Exception{
        // TODO Auto-generated method stub
    	for(int i = 0;i<id.length;i++){
    		 //同时也删除微信用户对应的反馈信息
        	feedbackMapper.deleteFeedbackByWxuserId(id[i]);
    	}
        wxUserMapper.deleteWxUserByIds(id);
    }

    public void insertWxUser(String openid, String phone) throws Exception{
        // TODO Auto-generated method stub
        wxUserMapper.insertWxUser(openid, phone);
    }

    /**
     * 根據openid和phone獲取微信用戶個數
     * @param openid 微信用戶openid
     * @param phone 手機號碼
     */
    public int getWxUserByOpenidOrPhone(String openid, String phone) throws Exception{
        // TODO Auto-generated method stub
        int n = 0;
        try{
            n = wxUserMapper.selectWxUserByOpenidOrPhone(openid, phone);
        }catch(Exception e){
            //查詢爲空
        }
        return n;
    }

    

}
