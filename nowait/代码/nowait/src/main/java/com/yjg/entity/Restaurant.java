package com.yjg.entity;

import java.util.Date;

/*
 * 餐厅
 */
public class Restaurant {
	private Integer id; // 自增id
	private String name;  //餐厅名
	private String priceInfo; //价格简介
	private String warnInfo;  //取号告示
	private String address;  //地址
	private String phone;  //客服电话
	private String shopTime;  //营业时间
	private String status;  //餐厅状况
	private String userId;  //用户id
	private String chainName;  //连锁店名称
	private String coverPic;  //餐厅门面图
	private String navPic;  //餐厅导航图
	private Double lng;  //经度
	private Double lat;  //纬度
	private Date createDate;  //创建时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPriceInfo() {
		return priceInfo;
	}

	public void setPriceInfo(String priceInfo) {
		this.priceInfo = priceInfo;
	}

	public String getWarnInfo() {
		return warnInfo;
	}

	public void setWarnInfo(String warnInfo) {
		this.warnInfo = warnInfo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getShopTime() {
		return shopTime;
	}

	public void setShopTime(String shopTime) {
		this.shopTime = shopTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getChainName() {
		return chainName;
	}

	public void setChainName(String chainName) {
		this.chainName = chainName;
	}

	public String getCoverPic() {
		return coverPic;
	}

	public void setCoverPic(String coverPic) {
		this.coverPic = coverPic;
	}

	public String getNavPic() {
		return navPic;
	}

	public void setNavPic(String navPic) {
		this.navPic = navPic;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
