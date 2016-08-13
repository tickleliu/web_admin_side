package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Mr Sale
 * 认证信息表
 *
 */
public class CmsOrgCert implements Serializable {
	
	public CmsOrgCert() {
		super();
		this.cert_id = 0L;
		this.uid = 0L;
		this.name = "";
		this.level = "";
		this.get_time = new Date();
		this.valid_time = new Date();
	}

	

	private Long cert_id;
	private Long uid; //user ID
	private String name; //认证名称
	private String level; //认证级别
	private Date get_time; //取得时间
	private Date valid_time; //有效期限
	
	//getters and setters
	public Long getCert_id() {
		return cert_id;
	}
	public void setCert_id(Long cert_id) {
		this.cert_id = cert_id;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Date getGet_time() {
		return get_time;
	}
	public void setGet_time(Date get_time) {
		this.get_time = get_time;
	}
	public Date getValid_time() {
		return valid_time;
	}
	public void setValid_time(Date valid_time) {
		this.valid_time = valid_time;
	}
}
