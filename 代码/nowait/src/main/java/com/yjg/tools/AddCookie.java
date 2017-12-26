package com.yjg.tools;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * cookie处理,设置cookies
 */
public class AddCookie {
	public static  void addCookie(String name, String password, String rememberMe,String type,
			HttpServletResponse response, HttpServletRequest request) throws Exception {  
	        //创建Cookie  
	        Cookie nameCookie=new Cookie("name",URLEncoder.encode(name,"utf-8"));  
	        Cookie pswCookie=new Cookie("pwd",password);
	        Cookie typeCookie=null;
	        if(type.equals("商家")){
	        	 typeCookie=new Cookie("type","user");
	        }else{
	        	 typeCookie=new Cookie("type","admin");  
	        }
	        
	        //设置Cookie的父路径  
	        nameCookie.setPath(request.getContextPath()+"/");  
	        pswCookie.setPath(request.getContextPath()+"/");  
	        typeCookie.setPath(request.getContextPath()+"/");  
	        //获取是否保存Cookie  
	        if(rememberMe.equals("false")){//不保存Cookie  
	            nameCookie.setMaxAge(0);  
	            pswCookie.setMaxAge(0);  
	            typeCookie.setMaxAge(0);
	        }else{//保存Cookie的时间长度，单位为秒  
	            nameCookie.setMaxAge(7*24*60*60);  
	            pswCookie.setMaxAge(7*24*60*60);  
	            typeCookie.setMaxAge(7*24*60*60);
	        }  
	        //加入Cookie到响应头  
	        response.addCookie(nameCookie);  
	        response.addCookie(pswCookie);  
	        response.addCookie(typeCookie);  
	}
}
