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
public class CmsTestController {

	@RequestMapping(value="test")
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
	
	static class UploadFilePathUtil {
		   public static UploadFilePathVO initFileUpload(Integer userID, String imageType, String suffix, int width, int height) {
		        String randomKey = "fadsfd";
		        Date date = new Date();
		        String dateStr = new SimpleDateFormat("yyyyMMdd").format(date);
		        String timeStr = new SimpleDateFormat("HHmmssSSS").format(date);
		        int hashcode = Math.abs(userID.hashCode() % 256);

		        String relativePath = "Helo";
		        String realPath = "D:\\Helo";

		        File logoSaveFile = new File(realPath);
		        if (!logoSaveFile.exists()) {
		            logoSaveFile.mkdirs();
		        }
		        // 图片文件名: 时间戳 + 随机串 + 高宽
		        String fileName = "test_graph";
		        UploadFilePathVO uploadFile = new UploadFilePathVO();
		        uploadFile.setRelativePath(StringUtil.join(relativePath, fileName));
		        uploadFile.setRealPath(StringUtil.join(realPath, fileName));
		        return uploadFile;
		    }
	}
	static class StringUtil {
		static public String join(String ... strings ) {
			String resultString = "";
			for (String string : strings) {
				resultString += string;
			}
			return resultString;
		}
	}
	
	static class UploadFilePathVO {
		
		public String getRealPath() {
			return realPath;
		}
		public void setRealPath(String realPath) {
			this.realPath = realPath;
		}
		public String getRelativePath() {
			return relativePath;
		}
		public void setRelativePath(String relativePath) {
			this.relativePath = relativePath;
		}
		public int getImgHeight() {
			return imgHeight;
		}
		public void setImgHeight(int imgHeight) {
			this.imgHeight = imgHeight;
		}
		public int getImgWidth() {
			return imgWidth;
		}
		public void setImgWidth(int imgWidth) {
			this.imgWidth = imgWidth;
		}
		public String realPath;
	    public String relativePath;
	    private int imgHeight; // 上传图片的高
	    private int imgWidth; // 宽
	}
        

}
