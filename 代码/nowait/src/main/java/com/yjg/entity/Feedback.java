package com.yjg.entity;

import java.util.Date;

/*
 * 信息反馈
 */
public class Feedback {
	private Integer id; // 自增id
	private Integer wxuserId; // 微信用户id
	private String info;  //反馈信息
	private Date createDate;  //日期
	private String isRead;   //是否已讀
	private WxUser wxUser; // 微信用户openid
	
	public WxUser getWxUser() {
		return wxUser;
	}

	public void setWxUser(WxUser wxUser) {
		this.wxUser = wxUser;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getWxuserId() {
		return wxuserId;
	}

	public void setWxuserId(Integer wxuserId) {
		this.wxuserId = wxuserId;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

}
