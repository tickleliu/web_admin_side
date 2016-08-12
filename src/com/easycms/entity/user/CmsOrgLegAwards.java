package com.easycms.entity.user;

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
		this.award_id = 0L;
		this.uid = 0L;
		this.get_time = new Date();
		this.title = "";		
	}
	
	private Long award_id;
	private Long uid; 
	private Date get_time; //获奖时间
	private String title; //获奖名称
	
	//getters and setters
	public Long getAward_id() {
		return award_id;
	}
	public void setAward_id(Long award_id) {
		this.award_id = award_id;
	}
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
