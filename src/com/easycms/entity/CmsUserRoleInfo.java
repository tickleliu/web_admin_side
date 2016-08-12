package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

public class CmsUserRoleInfo implements Serializable{
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public Integer getIsorg() {
		return isorg;
	}
	public void setIsorg(Integer isorg) {
		this.isorg = isorg;
	}
	public Integer getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(Integer isadmin) {
		this.isadmin = isadmin;
	}
	public Integer getIsexperter() {
		return isexperter;
	}
	public void setIsexperter(Integer isexperter) {
		this.isexperter = isexperter;
	}
	public Integer getIsmanager() {
		return ismanager;
	}
	public void setIsmanager(Integer ismanager) {
		this.ismanager = ismanager;
	}
	public Integer getIsengineer() {
		return isengineer;
	}
	public void setIsengineer(Integer isengineer) {
		this.isengineer = isengineer;
	}
	public Integer getIsent() {
		return isent;
	}
	public void setIsent(Integer isent) {
		this.isent = isent;
	}
	public Integer getIsleg() {
		return isleg;
	}
	public void setIsleg(Integer isleg) {
		this.isleg = isleg;
	}
	public Integer getIsgov() {
		return isgov;
	}
	public void setIsgov(Integer isgov) {
		this.isgov = isgov;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	Long uid;
	Integer isorg;
	Integer isadmin;
	Integer isexperter;
	Integer ismanager;
	Integer isengineer;
	Integer isent;
	Integer isleg;
	Integer isgov;
	Date create_time;
	Date update_time;
}
