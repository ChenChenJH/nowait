package com.yjg.entity;

/*
 * 餐厅用桌
 */
public class DeskUser {
	private Integer id; // 自增id
	private Integer restId; // 餐厅id
	private Integer deskId; // 桌子id

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRestId() {
		return restId;
	}

	public void setRestId(Integer restId) {
		this.restId = restId;
	}

	public Integer getDeskId() {
		return deskId;
	}

	public void setDeskId(Integer deskId) {
		this.deskId = deskId;
	}

}
