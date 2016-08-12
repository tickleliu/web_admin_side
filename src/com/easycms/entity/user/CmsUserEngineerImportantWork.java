package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserEngineerImportantWork implements Serializable {
	public Long getWord_id() {
		return word_id;
	}
	public void setWord_id(Long word_id) {
		this.word_id = word_id;
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
	Long word_id;
	Long uid;
	Date get_time;
	String work_name;

}
