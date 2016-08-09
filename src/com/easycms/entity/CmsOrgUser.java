package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 组织用户基本信息表
 * */
public class CmsOrgUser implements Serializable {
	public CmsOrgUser() {
		// TODO Auto-generated constructor stub
		aid = 0L;
		author = "";
		content = "";
		title = "";
		create_time = new Date();
		update_time = new Date();
		cate = "";
		this.igraph = 0;
		this.irecom = 0;
		this.gpath = "";
	}
	
	private Long aid;
	private String author;
	private Date create_time;
	private Date update_time;
	private String cate;
	private String title;
	private String content;
	private String gpath;
	private Integer irecom;
	private Integer igraph;
	
	public Long getAid() {
		return aid;
	}
	public void setAid(Long aid) {
		this.aid = aid;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGpath() {
		return gpath;
	}
	public void setGpath(String gpath) {
		this.gpath = gpath;
	}
	public Integer getIrecom() {
		return irecom;
	}
	public void setIrecom(Integer irecom) {
		this.irecom = irecom;
	}
	public Integer getIgraph() {
		return igraph;
	}
	public void setIgraph(Integer igraph) {
		this.igraph = igraph;
	}
}
