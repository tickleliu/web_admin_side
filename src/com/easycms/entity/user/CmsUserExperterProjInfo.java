package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserExperterProjInfo implements Serializable {
	private Long pid;
	private Long uid;
	private Date proj_start_time;
	private Date proj_end_time;
	private String intro;
	private String contribution;
	private String title;

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public Date getProj_start_time() {
		return proj_start_time;
	}

	public void setProj_start_time(Date proj_start_time) {
		this.proj_start_time = proj_start_time;
	}

	public Date getProj_end_time() {
		return proj_end_time;
	}

	public void setProj_end_time(Date proj_end_time) {
		this.proj_end_time = proj_end_time;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getContribution() {
		return contribution;
	}

	public void setContribution(String contribution) {
		this.contribution = contribution;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
