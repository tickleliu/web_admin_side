package com.easycms.entity;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 组织机构类用户附件信息表
 *
 */
public class CmsOrgUserAttachment implements Serializable {	
	
	public CmsOrgUserAttachment() {
		super();
		this.uid = 0L;
		this.path = "";
		this.title = "";		
	}
	
	private Long uid; 
	private String path; //附件路径
	private String title; //标题
	
	//getters and setters
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
