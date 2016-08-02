package com.easycms.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
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
	public String ajax(HttpServletRequest request) {
		return "ajax";
	}
	
	@RequestMapping(value="/ajax/resp")
	@ResponseBody
	public String responose(HttpServletRequest request) {
		logger.info("get ajax resp");
		return "ajax result";
	}

}
