package com.yjg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjg.entity.Admin;
import com.yjg.entity.User;
import com.yjg.mapper.UserMapper;
import com.yjg.service.UserService;
import com.yjg.tools.MD5Encryption;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	// 查询用户能否登录
	@Override
	public User selectUser(String name) throws Exception {
		User user = new User();
		user.setUserName(name);
		return userMapper.selectUser(user);
	}

	// 查询管理员能否登录
	@Override
	public Admin selectAdmin(String name) throws Exception {
		Admin admin = new Admin();
		admin.setAdminName(name);
		return userMapper.selectAdmin(admin);
	}

	// 插入
	public void insert(User user) throws Exception {
		user.setPwd(MD5Encryption.encrypt(user.getPwd()));
		userMapper.insert(user);
	}

}
