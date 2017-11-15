package com.yjg.service;

import com.yjg.entity.Admin;
import com.yjg.entity.User;

public interface UserService {

	// 查询用户能否登录
	public User selectUser(String userName) throws Exception;

	// 查询管理员能否登录
	public Admin selectAdmin(String adminName) throws Exception;

	// 插入
	public void insert(User user) throws Exception;

}
