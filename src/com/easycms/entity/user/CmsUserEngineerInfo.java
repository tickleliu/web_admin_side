package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserEngineerInfo implements Serializable {
private	Long uid;
private	String profession_engaged;
public Long getUid() {
	return uid;
}
public void setUid(Long uid) {
	this.uid = uid;
}
public String getProfession_engaged() {
	return profession_engaged;
}
public void setProfession_engaged(String profession_engaged) {
	this.profession_engaged = profession_engaged;
}
public String getMajor_category() {
	return major_category;
}
public void setMajor_category(String major_category) {
	this.major_category = major_category;
}
public String getDetail_category() {
	return detail_category;
}
public void setDetail_category(String detail_category) {
	this.detail_category = detail_category;
}
public Date getEngaged_time() {
	return engaged_time;
}
public void setEngaged_time(Date engaged_time) {
	this.engaged_time = engaged_time;
}
public String getProfession_ability() {
	return profession_ability;
}
public void setProfession_ability(String profession_ability) {
	this.profession_ability = profession_ability;
}
private	String major_category;
private	String detail_category;
private	Date engaged_time;
private	String profession_ability;
}
