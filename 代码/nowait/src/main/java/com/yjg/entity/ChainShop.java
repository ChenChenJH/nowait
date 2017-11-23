package com.yjg.entity;

/*
 * 连锁店
 */
public class ChainShop {
	private Integer id; // 自增id
	private String name; // 名称
	private String pic; // 封面图

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

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}
