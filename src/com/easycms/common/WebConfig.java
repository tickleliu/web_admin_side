package com.easycms.common;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import bsh.This;

public class WebConfig {
	private Logger logger = Logger.getLogger(This.class);
	public String getFtlTemplatePath() {
		return ftlTemplatePath;
	}
	public void setFtlTemplatePath(String ftlTemplatePath) {
		this.ftlTemplatePath = ftlTemplatePath;
	}
	public String getUpLoadImageBasePath() {
			try {
			FileUtils.forceMkdir(new File(UpLoadImageBasePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return UpLoadImageBasePath;
	}
	public void setUpLoadImageBasePath(String upLoadImageBasePath) {
	
		UpLoadImageBasePath = upLoadImageBasePath;
	}
	public String getWebUserSideRootPath() {
		
		try {
			FileUtils.forceMkdir(new File(webUserSideRootPath));
		} catch (IOException e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		
		return webUserSideRootPath;
	}
	public void setWebUserSideRootPath(String webUserSideRootPath) {
		this.webUserSideRootPath = webUserSideRootPath;
	}
	private String ftlTemplatePath = "";
	private String UpLoadImageBasePath = "F:\\apache-tomcat-7.0.63\\webapps\\upload\\";
	private String UpLoadImageBaseUrl = "http://localhost:8000/upload/";
	public String getUpLoadImageBaseUrl() {
		return UpLoadImageBaseUrl;
	}
	public void setUpLoadImageBaseUrl(String upLoadImageBaseUrl) {
		UpLoadImageBaseUrl = upLoadImageBaseUrl;
	}
	private String webUserSideRootPath = "D:\\Projects\\apache-tomcat\\webapps\\o\\";
	private String webUserSideRootUrl = "http://localhost:8000/o/";
	public String getWebUserSideRootUrl() {
		return webUserSideRootUrl;
	}
	public void setWebUserSideRootUrl(String webUserSideRootUrl) {
		this.webUserSideRootUrl = webUserSideRootUrl;
	}
	private String webAdminSideBaseUrl = "http://localhost:8000/easycms/";
	public String getWebUploadBaseUrl() {
		return webUploadBaseUrl;
	}
	public void setWebUploadBaseUrl(String webUploadBaseUrl) {
		this.webUploadBaseUrl = webUploadBaseUrl;
	}
	private String webUploadBaseUrl  = "";
	public String getWebAdminSideBaseUrl() {
		return webAdminSideBaseUrl;
	}
	public void setWebAdminSideBaseUrl(String webAdminSideBaseUrl) {
		this.webAdminSideBaseUrl = webAdminSideBaseUrl;
	}


}
