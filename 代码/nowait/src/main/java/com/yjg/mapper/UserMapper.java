package com.yjg.mapper;

import java.util.List;
import java.util.Map;

import com.yjg.entity.Admin;
import com.yjg.entity.User;

public interface UserMapper {
	// 查询用户能否登录
	public User selectUser(User user) throws Exception;

	// 查询管理员能否登录
	public Admin selectAdmin(Admin admin) throws Exception;

	// 插入
	public int insert(User user) throws Exception;

	//查询是否存在用户
	public int selectExist(String userName)throws Exception;

	//查询用户列表
	public List selectUserList() throws Exception;

	//查询用户详细信息
	public User selectDetailUser(Integer id) throws Exception;

	//修改用户
	public void update(User user)throws Exception;

	//删除用户
	public void delete(Integer id)throws Exception;

	//管理员查询原密码
	public int selectPwd(Map<String, Object> queryMap)throws Exception;
	
	//管理员修改密码
	public void updatePwd(Map<String, Object> queryMap)throws Exception;

	
}
