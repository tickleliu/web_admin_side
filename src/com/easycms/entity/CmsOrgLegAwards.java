package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Mr Sale
 * 联盟成员获奖信息表
 *
 */
public class CmsOrgLegAwards implements Serializable {	
	
	public CmsOrgLegAwards() {
		super();
		this.uid = 0L;
		this.get_time = new Date();
		this.title = "";		
	}
	
	private Long uid; 
	private Date get_time; //获奖时间
	private String title; //获奖名称
	
	//getters and setters	
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public Date getGet_time() {
		return get_time;
	}
	public void setGet_time(Date get_time) {
		this.get_time = get_time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
