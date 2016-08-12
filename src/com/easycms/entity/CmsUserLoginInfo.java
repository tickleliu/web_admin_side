package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

public class CmsUserLoginInfo implements Serializable{
	public Long getUidLong() {
		return uidLong;
	}
	public void setUidLong(Long uidLong) {
		this.uidLong = uidLong;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(Date creat_time) {
		this.creat_time = creat_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public String getUwechatid() {
		return uwechatid;
	}
	public void setUwechatid(String uwechatid) {
		this.uwechatid = uwechatid;
	}
	public String getHead_image() {
		return head_image;
	}
	public void setHead_image(String head_image) {
		this.head_image = head_image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	private Long uidLong;
	private String username;
	private String password;
	private Date creat_time;
	private Date update_time;
	private String uwechatid;
	private String head_image;
	private String email;
	private Integer status;
}
