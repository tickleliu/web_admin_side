package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserEngineerAcademicAchievement implements Serializable{
public Long getAcademic_id() {
	return academic_id;
}
public void setAcademic_id(Long academic_id) {
	this.academic_id = academic_id;
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
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

private Long academic_id;
private Long uid;
private Date get_time;
private String name;
}
