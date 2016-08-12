package com.easycms.entity.user;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 组织机构类用户，政府机构成员信息表
 *
 */
public class CmsOrgGovInfo implements Serializable {
	
	public CmsOrgGovInfo() {
		super();
		this.uid = 0L;
		this.gdp = 0L;
		this.gdp_growth = 0L;
		this.military_gdp = 0L;
	}

	private Long uid;
	private Long gdp; //主管机关
	private Long gdp_growth; //技术人员数
	private Long military_gdp; //人均产值
	
	//getters and setters
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public Long getGdp() {
		return gdp;
	}
	public void setGdp(Long gdp) {
		this.gdp = gdp;
	}
	public Long getGdp_growth() {
		return gdp_growth;
	}
	public void setGdp_growth(Long gdp_growth) {
		this.gdp_growth = gdp_growth;
	}
	public Long getMilitary_gdp() {
		return military_gdp;
	}
	public void setMilitary_gdp(Long military_gdp) {
		this.military_gdp = military_gdp;
	}
	
	
}
