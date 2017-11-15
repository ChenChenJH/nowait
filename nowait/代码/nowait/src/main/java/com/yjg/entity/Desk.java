package com.yjg.entity;

/*
 * 桌子类型
 */
public class Desk {
	private Integer id; //自增id
	private String style;  //桌子类型,如大桌，小桌，中桌
	private String info;  //人数信息,如1-2人，3-4人

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

}
