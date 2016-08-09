package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Mr Sale
 * 联盟成员重要工程信息表
 *
 */
public class CmsOrgLegProject implements Serializable {
	
	public CmsOrgLegProject() {
		super();
		this.uid = 0L;
		this.start_time = new Date();
		this.end_time = new Date();
		this.title = "";
		this.intro = "";
	}

	private Long uid;
	private Date start_time; //开始时间
	private Date end_time; //结束时间
	private String title; //标题
	private String intro; //介绍
	
	//getters and setters
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
}
