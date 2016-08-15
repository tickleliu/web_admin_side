package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserRoleInfo implements Serializable {
	public CmsUserRoleInfo() {
		uid = 1l;
		isorg = 2;
		isadmin = 2;
		isexperter = 2;
		ismanager = 2;
		isengineer = 2;
		isent = 2;
		isleg = 2;
		isgov = 2;
		issuperadmin = 2;
		create_time = new Date();
		update_time = new Date();
	}

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

	private Long uid;
	private Integer isorg;
	private Integer isadmin;
	private Integer issuperadmin;
	public Integer getIssuperadmin() {
		return issuperadmin;
	}

	public void setIssuperadmin(Integer issuperadmin) {
		this.issuperadmin = issuperadmin;
	}

	private Integer isexperter;
	private Integer ismanager;
	private Integer isengineer;
	private Integer isent;
	private Integer isleg;
	private Integer isgov;
	private Date create_time;
	private Date update_time;
}
