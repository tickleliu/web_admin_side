package com.easycms.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

@Controller
public class CmsUploadController {

	@RequestMapping(value="upload")
	@ResponseBody
	public String uploadHandlerForUploadify(@RequestParam MultipartFile file, HttpServletRequest request)
            throws Exception {
        Integer userID = 0;
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("filedata");
        System.out.println(file.isEmpty());
        System.out.println(file.getName());
        System.out.println(file.getSize());
        
        /** 写文件前先读出图片原始高宽 **/
        file.transferTo(new File("F:\\apache-tomcat-7.0.63\\webapps\\upload\\test.jpg"));

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("url", "http://localhost:8000/upload/test.jpg");
        return jsonObject.toString();
	}

}
