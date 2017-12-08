package com.yjg.service.impl;

import java.text.SimpleDateFormat;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.yjg.entity.Admin;
import com.yjg.entity.User;
import com.yjg.service.UserService;


@ContextConfiguration("classpath:applicationContext.xml")
public class TestUserServiceImpl extends AbstractJUnit4SpringContextTests{
	
	@Autowired
	private UserService userService;
	
	@Test
	public void testSelectUser() throws Exception{
		User user = userService.selectUser("chen");
		System.out.println(user.getId());
		System.out.println(user.getUserName());
		System.out.println(user.getPwd());
		System.out.println(user.getPhone());
		System.out.println(user.getTrueName());
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(user.getCreateDate()));
	}
	
	@Test
	public void testSelectAdmin() throws Exception{
		Admin admin = userService.selectAdmin("admin");
		System.out.println(admin.getId());
		System.out.println(admin.getAdminName());
		System.out.println(admin.getPwd());
	}
	
	@Test
	public void testInsert() throws Exception{
		User user = new User();
		user.setUserName("wang");
		user.setPwd("123");
		user.setTrueName("王大锤");
		user.setCard("440883199606011524");
		user.setPhone("13420156348");
		userService.insert(user);
	}
	
	@Test
	public void testSelectUserCount() throws Exception{
		System.out.println(userService.selectUserCount());
	}
	
	@Test
	public void selectUserList() throws Exception{
		System.out.println(userService.selectUserList(0, 4).size());
	}

}
