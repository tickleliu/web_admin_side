package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserEngineerImportantWork implements Serializable {
	public Long getWork_id() {
		return work_id;
	}
	public void setWork_id(Long work_id) {
		this.work_id = work_id;
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
	public String getWork_name() {
		return work_name;
	}
	public void setWork_name(String work_name) {
		this.work_name = work_name;
	}
	
	public CmsUserEngineerImportantWork(){
		super();
		this.work_id = 0L;
		this.uid = 0L;
		this.get_time = new Date();
		this.work_name = "";		
	}
	Long work_id;
	Long uid;
	Date get_time;
	String work_name;

}
