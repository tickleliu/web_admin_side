package com.easycms.entity.user;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 组织机构类用户基本信息表
 *
 */
public class CmsOrgUser implements Serializable {	
	
	public CmsOrgUser() {
		super();
		this.uid = 0L;
		this.enterprise_name = "";
		this.license_number = "";
		this.registered_capital = 0L;
		this.legal_representative = "";
		this.region = "";
		this.address = "";
		this.zip_code = "";
		this.enterprise_type = "";
		this.enterprise_nature = "";
		this.industry_fields = "";
		this.web_site = "";
		this.contact_name = "";
		this.contact_position = "";
		this.phone = "";
		this.email = "";
		this.main_business = "";
		this.resume = "";
		this.username = "";
	}
	
	private Long uid; 
	private String enterprise_name; //企业名称
	private String username;
	private String license_number; //工商营业执照号
	private Long registered_capital; //注册资金
	private String legal_representative; //法人代表
	private String region; //所在地区
	private String address; //通信地址
	private String zip_code; //邮编
	private String enterprise_type; //企业类型
	private String enterprise_nature; //企业性质
	private String industry_fields; //所属行业领域
	private String web_site; //企业网址
	private String contact_name; //联系人姓名
	private String contact_position; //联系人职务
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	private String phone; //联系电话
	private String email; //电子邮箱
	private String main_business; //主营业务
	private String resume; //简历
	
	//getters and setters
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getEnterprise_name() {
		return enterprise_name;
	}
	public void setEnterprise_name(String enterprise_name) {
		this.enterprise_name = enterprise_name;
	}
	public String getLicense_number() {
		return license_number;
	}
	public void setLicense_number(String license_number) {
		this.license_number = license_number;
	}
	public Long getRegistered_capital() {
		return registered_capital;
	}
	public void setRegistered_capital(Long registered_capital) {
		this.registered_capital = registered_capital;
	}
	
	public String getLegal_representative() {
		return legal_representative;
	}
	public void setLegal_representative(String legal_representative) {
		this.legal_representative = legal_representative;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getEnterprise_type() {
		return enterprise_type;
	}
	public void setEnterprise_type(String enterprise_type) {
		this.enterprise_type = enterprise_type;
	}
	public String getEnterprise_nature() {
		return enterprise_nature;
	}
	public void setEnterprise_nature(String enterprise_nature) {
		this.enterprise_nature = enterprise_nature;
	}
	public String getIndustry_fields() {
		return industry_fields;
	}
	public void setIndustry_fields(String industry_fields) {
		this.industry_fields = industry_fields;
	}
	public String getWeb_site() {
		return web_site;
	}
	public void setWeb_site(String web_site) {
		this.web_site = web_site;
	}
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public String getContact_position() {
		return contact_position;
	}
	public void setContact_position(String contact_position) {
		this.contact_position = contact_position;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMain_business() {
		return main_business;
	}
	public void setMain_business(String main_business) {
		this.main_business = main_business;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
}
