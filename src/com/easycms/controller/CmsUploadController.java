package com.easycms.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.CSS;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.easycms.common.WebConfig;
import com.easycms.entity.CmsArticle;
import com.easycms.service.CmsArticleService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="info/")
public class CmsUploadController {
	
	@Resource(name = "cmsArticleServiceImpl")
	private CmsArticleService as;
	
	@Resource(name = "webConfig")
	private WebConfig config;
	
	private static final String FOLDER_STRING = "main/";

	@RequestMapping(value="upload")
	@ResponseBody
	public String uploadHandlerForUploadify(HttpServletRequest request)
            throws Exception {
        Integer userID = 0;
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("fileupload");
        String suffix = file.getOriginalFilename().substring  
        		(file.getOriginalFilename().lastIndexOf(".")); 
        String aidString = request.getParameter("aid");
		Long aid = 0L;
		try {
			aid = new Long(aidString);
		} catch (NumberFormatException e) {
			return "exception";
		}
		
		String uuidFileName = Long.valueOf(System.currentTimeMillis()).toString();
		String gpath = config.getUpLoadImageBaseUrl() + FOLDER_STRING  + uuidFileName  + suffix;
		CmsArticle cmsArticle = null;
		cmsArticle = as.findArticleById(aid);
		if (cmsArticle == null) {
			cmsArticle = new CmsArticle();
			cmsArticle.setAid(aid);
			cmsArticle.setCreate_time(new Date());
			cmsArticle.setUpdate_time(new Date());
			cmsArticle.setGpath(gpath);
			as.save(cmsArticle);
		}	else {
			cmsArticle.setGpath(gpath);
			cmsArticle.setUpdate_time(new Date());
			as.updateArticle(cmsArticle);
		}

        /** 转存图片**/
		
		try {
			FileUtils.forceMkdir(new File(config.getUpLoadImageBasePath() + FOLDER_STRING));
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

        file.transferTo(new File(config.getUpLoadImageBasePath() + FOLDER_STRING + uuidFileName  + suffix));

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("url", gpath);
        return jsonObject.toString();
	}

}
