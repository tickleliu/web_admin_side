package com.easycms.common;

public class WebConfig {
	public String getFtlTemplatePath() {
		return ftlTemplatePath;
	}
	public void setFtlTemplatePath(String ftlTemplatePath) {
		this.ftlTemplatePath = ftlTemplatePath;
	}
	public String getUpLoadImageBasePath() {
		return UpLoadImageBasePath;
	}
	public void setUpLoadImageBasePath(String upLoadImageBasePath) {
		UpLoadImageBasePath = upLoadImageBasePath;
	}
	public String getWebUserSideRootPath() {
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
	private String webUserSideRootPath = "F:\\apache-tomcat-7.0.63\\webapps\\o\\";
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
