package com.easycms.entity;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 组织机构类用户附件信息表
 *
 */
public class CmsOrgLegBranches implements Serializable {	
	
	public CmsOrgLegBranches() {
		super();
		this.branch_id = 0L;
		this.uid = 0L;
		this.title = "";		
	}
	
	private Long branch_id;
	private Long uid; 
	private String title; //分支机构名称
	
	//getters and setters
	public Long getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(Long branch_id) {
		this.branch_id = branch_id;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
