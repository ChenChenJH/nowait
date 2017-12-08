package com.yjg.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yjg.entity.WxUser;
import com.yjg.service.WxUserService;

@Controller
@RequestMapping("wxuser")
public class WxUserController {

    @Resource
    private WxUserService wxUserService;
    
    /**
     * 根據起始行查詢7個微信用戶
     * @return List<WxUser>
     */
    @RequestMapping("getAllWxUser")
    public String getAllWxUser(ModelMap modelMap, @RequestParam("row") int row) throws Exception{
        
        //獲取微信用戶頁數，7個/頁
        int num = wxUserService.getAllWxUserCount();
        int page = num / 7;
        if(num%7 != 0){
            page++;
        }
        List<WxUser> wxUsers;
        //獲取第7*(row-1)個起後面7個微信用戶
        wxUsers = wxUserService.getAllWxUser(7*(row-1));
        modelMap.addAttribute("wxUsers", wxUsers);
        //當前頁
        modelMap.addAttribute("row", row);
        //總頁數
        modelMap.addAttribute("page", page);
        return "/mainFrame/wechatManager/wechatList.jsp";
        
    }
    
    /**
     * 根據id獲取微信用戶
     * @param id
     * @return WxUser
     */
    @RequestMapping("getWxUserById")
    public String getWxUserById(ModelMap modelMap, @RequestParam("id") int id) throws Exception{
        
        WxUser wxUser = wxUserService.getWxUserById(id);
        modelMap.addAttribute("wxUser", wxUser);
        return "/mainFrame/wechatManager/wechatDetail.jsp";
        
    }
   
    /**
     * 根據id刪除單個微信用戶
     * @param id 
     */
    @RequestMapping("deleteWxUserById")
    public String deleteWxUserByOpenId(ModelMap modelMap,@RequestParam("id") int id,int row) throws Exception{
        
        wxUserService.deleteWxUserById(id);
        //刷新當前頁
        return getAllWxUser(modelMap, row);
    }
    
    /**
     * 根據多個id刪除多個對應的微信用戶
     * @param id 
     */
    @RequestMapping("deleteWxUserByIds")
    public String deleteWxUserByOpenIds(ModelMap modelMap,@RequestParam("checkBox") int[] id,int row) throws Exception{
        
        wxUserService.deleteWxUserByIds(id);
        //刷新當前頁
        return getAllWxUser(modelMap, row);
        
    }
    
    /**
     * 添加單個微信用戶
     * @param openid 微信用戶openid
     * @param phone 用户手機號碼
     */
    @RequestMapping("insertWxUser")
    public String insertWxUser(ModelMap modelMap,@RequestParam("openid") String openid,
    		@RequestParam("phone") String phone,int row) throws Exception{
       
        //查詢數據庫中是否存在該openid或者手機號碼
        int n = wxUserService.getWxUserByOpenidOrPhone(openid, phone);
        if(n>0){
            return "/mainFrame/wechatManager/failManager.jsp?row="+row;
        }
        wxUserService.insertWxUser(openid,phone);
        return "/mainFrame/wechatManager/successOfManager.jsp?row="+row;
        
    }
}
