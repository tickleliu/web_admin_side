package com.easycms.entity.user;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 组织机构类用户，评估联盟成员信息表
 *
 */
public class CmsOrgLegInfo implements Serializable {
	
	public CmsOrgLegInfo() {
		super();
		this.uid = 0L;
		this.technical_person_number = 0L;
		this.per_capital_output = 0L;
		this.competent_authority = "";
	}

	private Long uid;
	private String competent_authority; //主管机关
	private Long technical_person_number; //技术人员数
	private Long per_capital_output; //人均产值
	
	//getters and setters
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getCompetent_authority() {
		return competent_authority;
	}
	public void setCompetent_authority(String competent_authority) {
		this.competent_authority = competent_authority;
	}
	public Long getTechnical_person_number() {
		return technical_person_number;
	}
	public void setTechnical_person_number(Long technical_person_number) {
		this.technical_person_number = technical_person_number;
	}
	public Long getPer_capital_output() {
		return per_capital_output;
	}
	public void setPer_capital_output(Long per_capital_output) {
		this.per_capital_output = per_capital_output;
	}
	
}
