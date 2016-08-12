package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

public class CmsEngineerWorkLife implements Serializable {
public Long getWork_life_id() {
	return work_life_id;
}
public void setWork_life_id(Long work_life_id) {
	this.work_life_id = work_life_id;
}
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
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public String getIntro() {
	return intro;
}
public void setIntro(String intro) {
	this.intro = intro;
}

private Long work_life_id;
private Long uid;
private Date start_time;
private Date end_time;
private String company;
private String position;
private String intro;

}
