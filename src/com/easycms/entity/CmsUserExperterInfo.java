package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

public class CmsUserExperterInfo implements Serializable {

private	Long uid;
public Long getUid() {
	return uid;
}
public void setUid(Long uid) {
	this.uid = uid;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public Date getYear_of_employment() {
	return year_of_employment;
}
public void setYear_of_employment(Date year_of_employment) {
	this.year_of_employment = year_of_employment;
}
public String getTechnical_grade() {
	return technical_grade;
}
public void setTechnical_grade(String technical_grade) {
	this.technical_grade = technical_grade;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getProfession_engaged() {
	return profession_engaged;
}
public void setProfession_engaged(String profession_engaged) {
	this.profession_engaged = profession_engaged;
}
public Date getProfession_engaged_time() {
	return profession_engaged_time;
}
public void setProfession_engaged_time(Date profession_engaged_time) {
	this.profession_engaged_time = profession_engaged_time;
}
public String getCurrent_position() {
	return current_position;
}
public void setCurrent_position(String current_position) {
	this.current_position = current_position;
}
public Date getCurrent_position_time() {
	return current_position_time;
}
public void setCurrent_position_time(Date current_position_time) {
	this.current_position_time = current_position_time;
}
private	String category;
private	Date year_of_employment;
private	String technical_grade;
private	String title;
private	String profession_engaged;
private	Date profession_engaged_time;
private	String current_position;
private	Date current_position_time;
}
