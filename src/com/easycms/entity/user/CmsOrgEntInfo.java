package com.easycms.entity.user;

import java.io.Serializable;

/**
 * @author Mr Sale
 * 组织机构类用户，评估联盟成员信息表
 *
 */
public class CmsOrgEntInfo implements Serializable {
	
	public CmsOrgEntInfo() {
		super();
		this.uid = 0L;
		this.employees = 0L;
		this.sales = 0L;
		this.profits = 0L;
		this.qualification = "";
	}

	private Long uid;
	private Long employees; //雇员数
	private Long sales; //销售额
	private Long profits; //盈利额
	private String qualification; //资质
	
	//getters and setters
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public Long getEmployees() {
		return employees;
	}
	public void setEmployees(Long employees) {
		this.employees = employees;
	}
	public Long getSales() {
		return sales;
	}
	public void setSales(Long sales) {
		this.sales = sales;
	}
	public Long getProfits() {
		return profits;
	}
	public void setProfits(Long profits) {
		this.profits = profits;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}	
}
