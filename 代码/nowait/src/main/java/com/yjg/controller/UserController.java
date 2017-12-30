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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjg.entity.LoginDTO;
import com.yjg.entity.User;
import com.yjg.service.UserService;
import com.yjg.tools.AddCookie;
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
			
			/*if(loginDTO.getIsReadme().equals("true")){
				// 记住我
				token.setRememberMe(true);
			}*/
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
			session.setAttribute("pwd", loginDTO.getPwd());
			if (loginDTO.getType().equals("商家")) {
				// 保存该用户的userId
				session.setAttribute("userId", (int)shiroSession.getAttribute("userId")); 
			}
			//处理cookie,保存login.jsp的登录信息
			AddCookie.addCookie(loginDTO.getName(), loginDTO.getPwd(), 
					loginDTO.getIsReadme(), loginDTO.getType(),response, request);
		}
		return result;
		
	}

	//判断user是否存在
	@RequestMapping(value="/isExist")
	@ResponseBody
	public String isExistUser(String userName) throws Exception{
		String ret = "false";
		int exist = this.userService.selectExist(userName);
		if(exist==1){
			ret = "true";
		}
		return ret;
	}
	
	//添加user
	@RequestMapping(value="/add")
	public String addUser(User user,int row) throws Exception{
		this.userService.insert(user);
		return "/mainFrame/userManager/success.jsp?row="+row;
	}
	
	//注册user
	@RequestMapping(value = "/register")
	public String registerUser(User user) throws Exception {
		this.userService.insert(user);
		return "redirect:/register_success.jsp";
	}
	
	//查询全部
	@RequestMapping(value="/list")
	public String listUser(Model model, @RequestParam(value="row",defaultValue = "1") int row) throws Exception{
		//返回数据库中用户的总数
		int num = userService.selectUserCount();
		//每页显示7条数据
        int size = 7; 
        //计算总页数
        int page = num / 7;
        if(num%7 != 0){
            page++;
        }
		List<User> userList = userService.selectUserList(size*(row-1), size);
		model.addAttribute("userList",userList);
		model.addAttribute("row",row);  //当前页
		model.addAttribute("page", page); //总页数
		return "/mainFrame/userManager/user_list.jsp";
	}
	
	//查询某个用户
	@RequestMapping(value="/Detail")
	public String detailUser(Model model,Integer id) throws Exception{
		User user = this.userService.selectDetailUser(id);
		model.addAttribute("user",user);
		return "/mainFrame/userManager/user_detail.jsp";
	}
	
	//修改某个用户
	@RequestMapping(value="/update")
	public String updateUser(User user,int row) throws Exception{
		this.userService.updateUser(user);
		return "/mainFrame/userManager/success.jsp?row="+row;
	}
	
	//删除某个用户
	@RequestMapping(value="/delete")
	public String updateUser(Model model,Integer id,int row) throws Exception{
		this.userService.deleteUser(id);
		return listUser(model,row);
	}
	
	//删除多个用户
	@RequestMapping(value="/deleteMore")
	public String deleteMore(String[] checkBox,Model model,int row)throws Exception{
		for(String id:checkBox){
			Integer newId = Integer.parseInt(id);
			this.userService.deleteUser(newId);
		}
		return listUser(model,row);
	}
	
	//修改密码
	@RequestMapping(value="/updatePwd")
	public String updatePwd(HttpSession session,String newPwd)throws Exception{
		String name = (String) session.getAttribute("name");
		String type = (String) session.getAttribute("type");
		//对密码进行加密
		String pwd = MD5Encryption.encrypt(newPwd);
		if(type.equals("商家")){
			userService.updateUserPwd(name, pwd);
		}else{
			userService.updateAdminPwd(name, pwd);
		}
		session.setAttribute("pwd", newPwd);
		return "/mainFrame/resetPassword_success.jsp";
	}
	
}