package com.yjg.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjg.entity.LoginDTO;
import com.yjg.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	// 登录
	@RequestMapping(value="/login",produces = "application/html; charset=utf-8")
	@ResponseBody
	public String isLogin(LoginDTO loginDTO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		String result = "true";
		Subject currentUser = SecurityUtils.getSubject();
		//获取shiro的session，存数据
		Session shiroSession = currentUser.getSession();
		shiroSession.setAttribute("type", loginDTO.getType());
		
		//判断用户是否登录，如果未登录则进行登录
		if (!currentUser.isAuthenticated()) {
			// 把用户名和密码封装为 UsernamePasswordToken 对象
			UsernamePasswordToken token = new UsernamePasswordToken(
					loginDTO.getName(), loginDTO.getPwd());
			
			try {
				// 执行登录.
				currentUser.login(token);
			} catch (UnknownAccountException e) {
				return "该账号不存在";
			} catch (Exception e) {
				return "密码错误!";
			}
			// 开启session会话，保存登录信息
			session.setAttribute("name", loginDTO.getName());
			session.setAttribute("type", loginDTO.getType());
			
			// 记住我
			if(loginDTO.getIsReadme().equals("true")){
				System.out.println("记住我");
				token.setRememberMe(true);
			}
			
			if (loginDTO.getType().equals("商家")) {
				// 保存该用户的userId
				session.setAttribute("userId", (int)shiroSession.getAttribute("userId")); 
			}
		}
		return result;
	}
	
}