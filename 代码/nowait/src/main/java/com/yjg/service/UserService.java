package com.yjg.service;

import java.util.List;

import com.yjg.entity.Admin;
import com.yjg.entity.User;

public interface UserService {

	// 查询用户能否登录
	public User selectUser(String userName) throws Exception;

	// 查询管理员能否登录
	public Admin selectAdmin(String adminName) throws Exception;

	// 插入
	public void insert(User user) throws Exception;

	//查询是否存在
	public int selectExist(String userName) throws Exception;

	//查看所有商家列表
	public List selectUserList()throws Exception;

	//查询某个用户
	public User selectDetailUser(Integer id) throws Exception;

	//修改某个用户
	public void updateUser(User user)throws Exception;

	//删除某个用户
	public void deleteUser(Integer id)throws Exception;

	//查询某个管理员密码
	public int selectPwd(String adminName, String pwd)throws Exception;

	//修改管理员密码
	public void updatePwd(String adminName, String newPwd)throws Exception;

}
