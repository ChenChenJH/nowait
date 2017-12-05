package com.yjg.controller;

import java.util.List;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjg.entity.LoginDTO;
import com.yjg.entity.User;
import com.yjg.service.UserService;
import com.yjg.tools.MD5Encryption;

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
			
			if (loginDTO.getType().equals("商家")) {
				// 保存该用户的userId
				session.setAttribute("userId", (int)shiroSession.getAttribute("userId")); 
			}
			
			if(loginDTO.getIsReadme() != null && loginDTO.getIsReadme() != ""){
				// 记住我
				//token.setRememberMe(true);
			}
		}
		return result;
		
	}

	//判断user是否存在
	@RequestMapping(value="/isExist")
	@ResponseBody
	public String isExistUser(String userName) throws Exception{
		String ret = "false";
		System.out.println(userName);
		int exist = this.userService.selectExist(userName);
		System.out.println(exist);
		if(exist==1){
			ret = "true";
		}
		return ret;
	}
	
	//添加user
	@RequestMapping(value="/add")
	public String addUser(User user) throws Exception{
		this.userService.insert(user);
		return "/mainFrame/userManager/success.jsp";
	}
	
	//注册user
		@RequestMapping(value="/register")
		public String registerUser(User user) throws Exception{
			this.userService.insert(user);
			return "/success.jsp";
		}
	
	
	//查询全部
	@RequestMapping(value="/list")
	public String listUser(Model model) throws Exception{
		//System.out.println("来到这里没有？");
		List<User> userList = this.userService.selectUserList();
		model.addAttribute("userList",userList);
		return "/mainFrame/userManager/user_list.jsp";
	}
	
	//查询某个用户
	@RequestMapping(value="/Detail")
	public String detailUser(Model model,Integer id) throws Exception{
		//System.out.println("来到这里没有？");
		User user = this.userService.selectDetailUser(id);
		model.addAttribute("user",user);
		return "/mainFrame/userManager/user_detail.jsp";
	}
	
	//修改某个用户
	@RequestMapping(value="/update")
	public String updateUser(User user) throws Exception{
		//System.out.println("来到这里没有？");
		//System.out.println(user.getTrueName());
		//System.out.println(user.getPhone());
		//System.out.println(user.getCard());
		this.userService.updateUser(user);
		return "/mainFrame/userManager/success.jsp";
	}
	
	//删除某个用户
	@RequestMapping(value="/delete")
	public String updateUser(Integer id) throws Exception{
		//System.out.println("来到这里没有？");
		this.userService.deleteUser(id);
		return "/mainFrame/userManager/success.jsp";
	}
	
	//删除多个用户
	@RequestMapping(value="/deleteMore")
	public String deleteMore(String[] checkBox)throws Exception{
		for(String id:checkBox){
			Integer newId = Integer.parseInt(id);
			this.userService.deleteUser(newId);
		}
		return "/mainFrame/userManager/success.jsp";
	}
	
	//查询原密码是否正确
	@RequestMapping(value="/selectPwd")
	@ResponseBody
	public String selectPwd(String adminName,String pwd)throws Exception{
		String ret = "false";
		pwd = MD5Encryption.encrypt(pwd);
		int res = this.userService.selectPwd(adminName,pwd);
		if(res==1){
			ret = "true";
		}
		return ret;
	}
	
	//修改自己的密码
	@RequestMapping(value="/updatePwd")
	public String updatePwd(String adminName,String newPwd)throws Exception{
		newPwd = MD5Encryption.encrypt(newPwd);
		this.userService.updatePwd(adminName,newPwd);
		return "/mainFrame/userManager/success.jsp";
	}
	
}