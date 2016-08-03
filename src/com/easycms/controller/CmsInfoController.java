package com.easycms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycms.entity.CmsArticle;
import com.easycms.service.CmsArticleService;

@Controller
@RequestMapping("/info")
public class CmsInfoController {

	@Resource(name = "cmsArticleServiceImpl")
	private CmsArticleService as;

	@RequestMapping("/intro_e.do")
	public String centerInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		model.addAttribute("content", "这里写你的初始內容");
		return "editor";
	}

	@RequestMapping("/show")
	public String show(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		CmsArticle cmsArticle = new CmsArticle();
		cmsArticle.setAid(new Long(System.currentTimeMillis()));
		cmsArticle.setAuthor("lml");
		cmsArticle.setCate(request.getParameter("category"));
		cmsArticle.setContent(request.getParameter("content"));
		cmsArticle.setCreate_time(new Date());
		cmsArticle.setTitle(request.getParameter("title"));
		cmsArticle.setUpdate_time(new Date());
		as.save(cmsArticle);
		CmsArticle cArticle = as.findById(cmsArticle.getAid());
		System.out.println(cArticle.getTitle());
		model.addAttribute("author", cmsArticle.getAuthor());
		model.addAttribute("content", cmsArticle.getContent());
		model.addAttribute("title", cmsArticle.getTitle());
		model.addAttribute("category", cmsArticle.getCate());
		return "show";
	}
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/ajax")
	@ResponseBody
	public String ajax(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", 100);
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();
		Random random = new Random(System.currentTimeMillis());
		String string = "abcdefghijklmnopqrstuvwxyz";
		String[] categories = {"news", "info", "center"};
		for (int i = 0; i < 10; i++) {
			HashedMap map = new HashedMap();
			map.put("aid", System.currentTimeMillis());
			String author = "";
			for (int j = 0; j < 4; j++) {
				author += string.charAt(random.nextInt(string.length()));
			}
			map.put("autor", author);
			String category = categories[random.nextInt(categories.length)];
			map.put("category",category);
			String title= "";
			for (int j = 0; j < 14; j++) {
				title += string.charAt(random.nextInt(string.length()));
			}
			map.put("title", title);
			jsonArray.put(map);
			
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value="/ajax/resp")
	@ResponseBody
	public String responose(HttpServletRequest request) {
		logger.info("get ajax resp");
		return "ajax result";
	}

}
