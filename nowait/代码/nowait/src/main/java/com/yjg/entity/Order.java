package com.yjg.entity;

import java.util.Date;

/*
 * 排号单
 */
public class Order {
	private Integer id; // 自增id
	private Integer wxuserId; // 微信用户id
	private Integer restId; // 微信用户id
	private String restName; // 餐厅名
	private String style; // 桌子类型
	private String info; // 人数信息
	private String waitNo; // 排队号码
	private Date createDate; // 下单日期
	private String isUsage; // 是否能用
	private String warnInfo; // 取号告示

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

	public Integer getRestId() {
		return restId;
	}

	public void setRestId(Integer restId) {
		this.restId = restId;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getWaitNo() {
		return waitNo;
	}

	public void setWaitNo(String waitNo) {
		this.waitNo = waitNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getIsUsage() {
		return isUsage;
	}

	public void setIsUsage(String isUsage) {
		this.isUsage = isUsage;
	}

	public String getWarnInfo() {
		return warnInfo;
	}

	public void setWarnInfo(String warnInfo) {
		this.warnInfo = warnInfo;
	}

}
