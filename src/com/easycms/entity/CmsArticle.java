package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

public class CmsArticle implements Serializable {
	public CmsArticle() {
		// TODO Auto-generated constructor stub
		aid = 0L;
		author = "";
		content = "";
		title = "";
		create_time = new Date();
		update_time = new Date();
		cate = "";
	}

	private Long aid;
	private String author;
	private Date create_time;
	private Date update_time;

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
		if(author == null) {
			author = "匿名";
		}
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
		if(title == null) {
			title = "无标题";
		}
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		if(content == null) {
			this.content = "无内容";
		}
		this.content = content;
	}

	private String cate;
	private String title;
	private String content;
}
