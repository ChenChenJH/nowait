package com.yjg.mapper;

import com.yjg.entity.Admin;
import com.yjg.entity.User;

public interface UserMapper {
	// 查询用户能否登录
	public User selectUser(User user) throws Exception;

	// 查询管理员能否登录
	public Admin selectAdmin(Admin admin) throws Exception;

	// 插入
	public int insert(User user) throws Exception;
}
