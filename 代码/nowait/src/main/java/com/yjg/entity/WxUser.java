package com.yjg.entity;

import java.util.Date;

/*
 * 微信用户
 */
public class WxUser {
	private Integer id;   //自增id
	private String openid;   //微信用户openid
	private String phone;   //手机号码
	private Date createDate;  //创建时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
