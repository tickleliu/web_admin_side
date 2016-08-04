package com.easycms.controller;

import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.border.TitledBorder;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycms.common.FreeMarkerUtils;
import com.easycms.entity.CmsArticle;
import com.easycms.service.CmsArticleService;

@Controller
@RequestMapping("/info")
public class CmsInfoController {

	@Resource(name = "cmsArticleServiceImpl")
	private CmsArticleService as;

	private static final Long CENTERINTRO_ID = 100L;
	private static final Long ORGINTRO_ID = 200L;
	private static String[] categoryStrings = { "新闻资讯", "政策解读", "技术前沿", "试点信息",
			"认证信息" };
	private Logger logger = Logger.getLogger(this.getClass());

	/**
	 * 基本情况
	 */
	@RequestMapping("/intro_e.do")
	public String centerInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String category = request.getParameter("cate");
		String aid = CENTERINTRO_ID.toString();
		String content = "这里写你的初始內容";// 缺省编辑器文本区内容

		CmsArticle article = null;// 当前基本情况的信息，如果已经有了，那么使用它初始化文本编辑器

		if (category == null || category.equals("") || category.equals("info")) {
			category = "中心概况";
			aid = CENTERINTRO_ID.toString();
			article = as.findArticleById(CENTERINTRO_ID);
		} else if (category.equals("org")) {
			category = "组织架构";
			aid = ORGINTRO_ID.toString();
			article = as.findArticleById(ORGINTRO_ID);
		}

		if (article != null) {
			content = article.getContent();
		}

		model.addAttribute("content", content);
		model.addAttribute("aid", aid);
		model.addAttribute("category", category);

		return "info/center_intro";
	}

	/**
	 * 基本情况修改展示
	 */
	@RequestMapping("/intro_modify")
	public String introModify(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String aidString = request.getParameter("aid");
		String cate = "";
		if (aidString == null || aidString.equals("")) {
			return "exception";
		} else {
			Long aid = new Long(aidString);
			if (aid.equals(CENTERINTRO_ID) || aid.equals(ORGINTRO_ID)) {

				cate = "中心概况";
				if (aid.equals(ORGINTRO_ID)) {
					cate = "组织架构";
				}
				CmsArticle cmsArticle = null;
				cmsArticle = as.findArticleById(aid);
				if (cmsArticle == null) {
					cmsArticle = new CmsArticle();
					cmsArticle.setAid(aid);
					cmsArticle.setCate(cate);
					cmsArticle.setTitle(cate);
					cmsArticle.setCreate_time(new Date());
					cmsArticle.setUpdate_time(new Date());
					cmsArticle.setContent("");
					as.save(cmsArticle);
				}
				cmsArticle.setAuthor("admin");
				cmsArticle.setContent(request.getParameter("content"));
				cmsArticle.setUpdate_time(new Date());
				as.update(cmsArticle);
				String backurl = "info/intro_e.do?cate=";
				if (aidString.equals(CENTERINTRO_ID.toString())) {
					backurl += "info";
				} else {
					backurl += "org";
				}
				model.addAttribute("backurl", backurl);
				model.addAttribute("cate", cate);
				return "info/modify_result";
			}
			return "exception";
		}
	}

	/**
	 * 信息发布，编辑
	 * */
	@RequestMapping("/info_e.do")
	public String editInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String content = "这里写你的初始內容";// 缺省编辑器文本区内容
		String category = "1";
		String title = "请输入标题";
		String author = "匿名";
		String aidString = request.getParameter("aid");
		Long aid = null;

		if (aidString == null || aidString.equals("")) {
			aid = System.currentTimeMillis();
		} else {
			try {
				aid = new Long(aidString);
			} catch (NumberFormatException e) {
				// TODO: handle exception
				aid = System.currentTimeMillis();
			}
			CmsArticle article = null;// 当前基本情况的信息，如果已经有了，那么使用它初始化文本编辑器
			article = as.findArticleById(aid);
			if (article != null) {
				content = article.getContent();
				category = article.getCate();
				author = article.getAuthor();
			}
		}
		model.addAttribute("content", content);
		model.addAttribute("aid", aid);
		model.addAttribute("title", title);
		model.addAttribute("author", author);
		model.addAttribute("category", category);
		model.addAttribute("categories", categoryStrings);

		return "info/info_editor";
	}

	/**
	 * 信息处理结果
	 */
	@RequestMapping("/info_modify")
	public String infoModify(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String aidString = request.getParameter("aid");

		if (aidString == null || aidString.equals("")) {
			return "exception";
		}

		Long aid = 0L;
		try {
			aid = new Long(aidString);
		} catch (NumberFormatException e) {
			return "exception";
		}

		// 验证是否提供了正确的分类
		String category = request.getParameter("category");
		int categorIndex = 0;
		if (category == null || category.equals("")) {
			return "exception";
		}
		try {
			categorIndex = new Integer(category);
			if (categorIndex > categoryStrings.length || categorIndex <= 0) {
				return "exception";
			}
		} catch (NumberFormatException e) {
			return "exception";
		}

		CmsArticle cmsArticle = null;
		cmsArticle = as.findArticleById(aid);

		if (cmsArticle == null) {
			cmsArticle = new CmsArticle();
			cmsArticle.setAid(aid);
			as.save(cmsArticle);
		}

		cmsArticle.setCate(categoryStrings[categorIndex - 1]);
		cmsArticle.setAuthor(request.getParameter("author"));
		cmsArticle.setTitle(request.getParameter("title"));
		cmsArticle.setContent(request.getParameter("content"));
		cmsArticle.setUpdate_time(new Date());
		as.update(cmsArticle);
		String backurl = "info/info_e.do";
		model.addAttribute("backurl", backurl);
		model.addAttribute("cate", categoryStrings[categorIndex - 1]);
		model.addAttribute("title", cmsArticle.getTitle());
		return "info/modify_result";
	}

	@RequestMapping(value = "/info_s")
	public String showInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("categories", categoryStrings);
		
		return "info/info_show";
	}
	
	@RequestMapping(value="/info_d")
	public String deleteInfoResult(HttpServletRequest request, HttpServletResponse response, Model model) {
		String idString = request.getParameter("ids");
		System.out.println(idString);
		model.addAttribute("result", "成功");
		
		return "info/info_delete";
	}

	@RequestMapping(value = "/info_g")
	@ResponseBody
	public String getInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
		String datafrom = request.getParameter("datefrom");
		String datato= request.getParameter("dateto");
		String keyword= request.getParameter("keyw");
		String categoryR= request.getParameter("ct");
		String authorR= request.getParameter("author");
		String pageString = request.getParameter("page");
		String rowsString= request.getParameter("rows");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", 100);
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();
		Random random = new Random(System.currentTimeMillis());
		String string = "abcdefghijklmnopqrstuvwxyz";
		String[] categories = { "news", "info", "center" };
		for (int i = 0; i < 10; i++) {
			HashedMap map = new HashedMap();
			map.put("aid", System.currentTimeMillis());
			String author = "";
			for (int j = 0; j < 4; j++) {
				author += string.charAt(random.nextInt(string.length()));
			}
			map.put("autor", author);
			String category = categories[random.nextInt(categories.length)];
			map.put("category", category);
			String title = "";
			for (int j = 0; j < 14; j++) {
				title += string.charAt(random.nextInt(string.length()));
			}
			map.put("title", title);
			jsonArray.put(map);

		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}

	@RequestMapping(value = "/ajax/resp")
	@ResponseBody
	public String responose(HttpServletRequest request) {
		logger.info("get ajax resp");
		return "ajax result";
	}

	//
	@RequestMapping(value = "static")
	@ResponseBody
	public String staticText(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ServletContext context = request.getServletContext();
		String template = "admin/pages/template";
		FreeMarkerUtils.initConfig(context, template);
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("content", "this is the content");
		dataMap.put("basePath", "http://localhost:8000/");
		FreeMarkerUtils.processTemplate("center_intro.ftl", dataMap,
				"F://test.html");
		return "success";
	}

}
