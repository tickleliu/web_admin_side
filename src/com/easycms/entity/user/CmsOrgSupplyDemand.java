package com.easycms.entity.user;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 企业供需表
 *
 */
public class CmsOrgSupplyDemand implements Serializable {
	
	public CmsOrgSupplyDemand() {
		super();
		this.sd_id = 0L;
		this.uid = 0L;
		this.isS_D = "";
		this.title = "";
		this.intro = "";
	}

	private Long sd_id;
	private Long uid;
	private String isS_D; //供应还是需求
	private String title; //标题
	private String intro; //供需介绍
	
	//getters and setters
	public Long getSd_id() {
		return sd_id;
	}
	public void setSd_id(Long sd_id) {
		this.sd_id = sd_id;
	}
	public Long getUid() {
		return uid;
	}	
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getIsS_D() {
		return isS_D;
	}
	public void setIsS_D(String isS_D) {
		this.isS_D = isS_D;
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
