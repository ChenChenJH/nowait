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
     * 获取所有微信用户
     * @return List<WxUser>
     */
    @RequestMapping("getAllWxUser")
    public String getAllWxUser(ModelMap modelMap){
        
        List<WxUser> wxUsers;
        wxUsers = wxUserService.getAllWxUser();
        modelMap.addAttribute("wxUsers", wxUsers);
        return "/mainFrame/wechatManager/wechatList.jsp";
        
    }
    
    /**
     * 根据id获取微信用户
     * @param id
     * @return WxUser
     */
    @RequestMapping("getWxUserById")
    public String getWxUserById(ModelMap modelMap,@RequestParam("id") int id){
        
        WxUser wxUser = wxUserService.getWxUserById(id);
        System.out.println(wxUser.getCreateDate());
        modelMap.addAttribute("wxUser", wxUser);
        return "/mainFrame/wechatManager/wechatDetail.jsp";
        
    }
   
    /**
     * 根据id删除单个微信用户
     * @param id 微信用户id
     */
    @RequestMapping("deleteWxUserById")
    public String deleteWxUserByOpenId(ModelMap modelMap,@RequestParam("id") int id){
        
        wxUserService.deleteWxUserById(id);
        return "/mainFrame/wechatManager/successOfManager.jsp";
        
    }
    
    /**
     * 根据多个id删除多个对应的微信用户
     * @param id 微信用户id
     */
    @RequestMapping("deleteWxUserByIds")
    public String deleteWxUserByOpenIds(ModelMap modelMap,@RequestParam("checkBox") int[] id){
        
        wxUserService.deleteWxUserByIds(id);
        return "/mainFrame/wechatManager/successOfManager.jsp";
        
    }
    
    /**
     * 添加单个微信用户
     * @param openid 微信用户openid
     * @param phone 用户手机号码
     */
    @RequestMapping("insertWxUser")
    public String insertWxUser(ModelMap modelMap,@RequestParam("openid") String openid,@RequestParam("phone") String phone){
       
        //获取数据库中是否存在该openid或者手机号码
        int n = wxUserService.getWxUserByOpenidOrPhone(openid, phone);
        if(n>0){
            return "/mainFrame/wechatManager/failManager.jsp";
        }
        wxUserService.insertWxUser(openid,phone);
        return "/mainFrame/wechatManager/successOfManager.jsp";
        
    }
}
