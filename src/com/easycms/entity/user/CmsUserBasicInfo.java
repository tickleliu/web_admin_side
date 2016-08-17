package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserBasicInfo implements Serializable {
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getIdcard_number() {
		return idcard_number;
	}
	public void setIdcard_number(String idcard_number) {
		this.idcard_number = idcard_number;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Long getHeighth() {
		return heighth;
	}
	public void setHeighth(Long heighth) {
		this.heighth = heighth;
	}
	public String getCulture_degree() {
		return culture_degree;
	}
	public void setCulture_degree(String culture_degree) {
		this.culture_degree = culture_degree;
	}
	public String getPolitical_landscape() {
		return political_landscape;
	}
	public void setPolitical_landscape(String political_landscape) {
		this.political_landscape = political_landscape;
	}
	public Date getInto_the_party_time() {
		return into_the_party_time;
	}
	public void setInto_the_party_time(Date into_the_party_time) {
		this.into_the_party_time = into_the_party_time;
	}
	public String getNativ() {
		return nativ;
	}
	public void setNativ(String nativ) {
		this.nativ = nativ;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Date getGraduation_time() {
		return graduation_time;
	}
	public void setGraduation_time(Date graduation_time) {
		this.graduation_time = graduation_time;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getFirst_record() {
		return first_record;
	}
	public void setFirst_record(String first_record) {
		this.first_record = first_record;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public Date getFirst_word_time() {
		return first_work_time;
	}
	public void setFirst_word_time(Date first_work_time) {
		this.first_work_time = first_work_time;
	}
	public String getWork_unit() {
		return work_unit;
	}
	public void setWork_unit(String work_unit) {
		this.work_unit = work_unit;
	}
	public String getUnit_category() {
		return unit_category;
	}
	public void setUnit_category(String unit_category) {
		this.unit_category = unit_category;
	}
	public String getPosition_level() {
		return position_level;
	}
	public void setPosition_level(String position_level) {
		this.position_level = position_level;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	

	public CmsUserBasicInfo(){
		super();
		this.uid = 0L;
		this.user_name = "";
		this.email = "";
		this.phone = "";
		this.realname = "";
		this.idcard_number = "";
		this.sex = 1;
		this.bloodtype = "";
		this.nation = "";
		this.heighth = 0L;
		this.culture_degree = "";
		this.political_landscape = "";
		this.into_the_party_time = new Date();
		this.nativ = "";
		this.birth = new Date();
		this.school = "";
		this.graduation_time = new Date();
		this.specialty = "";
		this.first_record = "";
		this.degree = "";
		this.first_work_time = new Date();
		this.work_unit = "";
		this.unit_category = "";
		this.position_level = "";
		this.zip_code = "";
		this.address = "";
		this.resume = "";
		
	}
	private Long uid;
	private String user_name; //昵称
	private String email; //电子邮件
	private String phone; //联系电话	 
	private String realname; //真实姓名
	private String idcard_number; //身份证号
	private Integer sex; //性别
	private String bloodtype; //血型
	private String nation; //民族
	private Long heighth; //身高
	private String culture_degree; //文化程度
	private String political_landscape; //政治面貌
	private Date into_the_party_time; //入党团时间
	private String nativ; //籍贯
	private Date birth; //出生年月日
	private String school; //毕业学校
	private Date graduation_time; //毕业时间
	private String specialty; //专业
	private String first_record; //第一学历
	private String degree; //学位
	private Date first_work_time; //参加工作时间
	private String work_unit; //工作单位
	private String unit_category; //单位类型
	private String position_level; //职务
	private String zip_code; //邮编
	private String address; //工作地址
	private String resume; //个人简介
	
}
