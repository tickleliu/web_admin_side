package com.easycms.controller;

import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.border.TitledBorder;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycms.common.FreeMarkerUtils;
import com.easycms.common.Pager;
import com.easycms.entity.CmsArticle;
import com.easycms.service.CmsArticleService;

@Controller
@RequestMapping("/info")
public class CmsInfoController {

	@Resource(name = "cmsArticleServiceImpl")
	private CmsArticleService as;

	private static final Long CENTERINTRO_ID = 100L;
	private static final Long ORGINTRO_ID = 200L;
	private static final Long CONTACT_ID = 300L;
	private static String[] CategoryStrings = { "新闻资讯", "政策解读", "技术前沿", "试点信息",
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
		} else if (category.equals("contact")) {
			category = "联系我们";
			aid = CONTACT_ID.toString();
			article = as.findArticleById(CONTACT_ID);
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
			if (aid.equals(CENTERINTRO_ID) || aid.equals(ORGINTRO_ID)
					|| aid.equals(CONTACT_ID)) {

				cate = "中心概况";
				if (aid.equals(ORGINTRO_ID)) {
					cate = "组织架构";
				} else if (aid.equals(CONTACT_ID)) {
					cate = "联系我们";
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
				String content = request.getParameter("content");
				if (content != null) {
					content = content.replace("'", "\"");
				} else {
					content = "";
				}
				cmsArticle.setContent(content);
				cmsArticle.setUpdate_time(new Date());
				as.update(cmsArticle);
				String backurl = "info/intro_e.do?cate=";
				if (aidString.equals(CENTERINTRO_ID.toString())) {
					backurl += "info";
				} else if (aidString.equals(ORGINTRO_ID.toString())) {
					backurl += "org";
				} else {
					backurl += "contact";
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
				int index = 1;
				for (int i = 0; i < CategoryStrings.length; i++) {
					if (CategoryStrings[i].equals(category)) {
						index += i;
					}
				}
				author = article.getAuthor();
				category = new Integer(index).toString();
				title = article.getTitle();
			}
		}
		model.addAttribute("content", content);
		model.addAttribute("aid", aid);
		model.addAttribute("title", title);
		model.addAttribute("author", author);
		model.addAttribute("category", category);
		model.addAttribute("categories", CategoryStrings);

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
			if (categorIndex > CategoryStrings.length || categorIndex <= 0) {
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

		String content = request.getParameter("content");
		if (content != null) {
			content = content.replace("'", "\"");
		} else {
			content = "";
		}

		cmsArticle.setContent(content);
		cmsArticle.setCate(CategoryStrings[categorIndex - 1]);
		cmsArticle.setAuthor(request.getParameter("author"));
		cmsArticle.setTitle(request.getParameter("title"));
		cmsArticle.setContent(content);
		cmsArticle.setUpdate_time(new Date());
		as.update(cmsArticle);
		String backurl = "info/info_s";
		model.addAttribute("backurl", backurl);
		model.addAttribute("cate", CategoryStrings[categorIndex - 1]);
		model.addAttribute("title", cmsArticle.getTitle());
		return "info/modify_result";
	}

	/**
	 * 信息列表展示页
	 * */
	@RequestMapping(value = "/info_s")
	public String showInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		model.addAttribute("categories", CategoryStrings);

		return "info/info_show";
	}

	/**
	 * 信息删除页
	 * */
	@RequestMapping(value = "/info_d")
	@ResponseBody
	public String deleteInfoResult(@RequestBody String deleteIds,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		JSONObject jsonObject = new JSONObject(deleteIds);
		JSONArray jsonArray = jsonObject.getJSONArray("deleteIds");
		int length = jsonArray.length();
		for (int i = 0; i < length; i++) {
			Long aid = jsonArray.getLong(i);
			System.out.println(aid);
			as.deleteArticleById(aid);
		}
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("result", "success");
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		return jsonObject2.toString();
	}

	private String reformatDateString(String dateString) {
		if (dateString != null && dateString.split("-").length == 3) {
			String[] dateStrings = dateString.split("-");
			return dateStrings[0] + "-" + dateStrings[1] + "-" + dateStrings[2];
		}
		return null;
	}

	private String removeIllegalChar(String old) {
		// String set = "\"'";
		String newString = "";
		newString = old.replace("'", " ");
		newString = newString.replace("\"", " ");
		return newString;
	}

	/**
	 * 新闻管理列表生成 增加了中文数据处理
	 * */
	@RequestMapping(value = "/info_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = reformatDateString(request.getParameter("datefrom"));
		if (datefrom != null) {
			map.put("datefrom", datefrom);
		}
		String dateto = reformatDateString(request.getParameter("dateto"));
		if (dateto != null) {
			map.put("dateto", dateto);
		}

		String categoryString = request.getParameter("ct");
		int category = 0;
		try {
			category = Integer.parseInt(categoryString);
			if (category > 0 && category <= CategoryStrings.length) {
				map.put("category", CategoryStrings[category - 1]);
			}
		} catch (NumberFormatException e) {
			// TODO: handle exception
		}

		String author = request.getParameter("author");
		if (author != null) {
			map.put("author", author);
		}

		String irecomString = request.getParameter("irecom");
		if (irecomString != null) {
			if (irecomString.equals("1") || irecomString.equals("on")) {
				map.put("irecom", 1);
			}
		}

		String igraphString = request.getParameter("igraph");
		if (igraphString != null) {
			if (igraphString.equals("1") || igraphString.equals("on")) {
				map.put("igraph", 1);
			}
		}

		int showPages = 0;
		String pageString = request.getParameter("page");
		if (pageString != null) {
			try {
				showPages = Integer.parseInt(pageString) - 1;
			} catch (NumberFormatException e) {
				// TODO: handle exception
				showPages = 0;
			}
		}

		int pageSize = 10;
		String rowsString = request.getParameter("rows");
		if (rowsString != null) {
			try {
				pageSize = Integer.parseInt(rowsString);
			} catch (NumberFormatException e) {
				// TODO: handle exception
				pageSize = 10;
			}
		}

		showPages = showPages * pageSize;
		String keyword = request.getParameter("keyw");

		List<String> keywords = new LinkedList<String>();
		if (keyword != null) {
			StringTokenizer stringTokenizer = new StringTokenizer(keyword,
					" ,\t");
			while (stringTokenizer.hasMoreTokens()) {
				String tokenString = stringTokenizer.nextToken();
				if (tokenString.trim().length() > 0) {
					keywords.add(tokenString.trim());
				}
			}
		}
		if (keywords.size() > 0) {
			map.put("keyw", keywords);
		}

		Pager<CmsArticle> pager = as
				.findArticlesByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsArticle article : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("aid", article.getAid());
			jsonMap.put("category", article.getCate());
			jsonMap.put("author", article.getAuthor());
			String create_time = DateFormatUtils.format(
					article.getCreate_time(), "yyyy-MM-dd");
			jsonMap.put("create_time", create_time);
			// jsonMap.put("update_time", article.getAid());
			jsonMap.put("title", article.getTitle());
			
			if (article.getIrecom() == 1) {
				jsonMap.put("irecom", "是");
			} else {
				jsonMap.put("irecom", "否");
			}

			if (article.getIgraph() == 1) {
				jsonMap.put("igraph", "是");
			} else {
				jsonMap.put("igraph", "否");
			}
			jsonArray.put(jsonMap);
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
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//////////////////////////////////////////////////////////
		//增加一个列表
		List<Map<String, String>> aList = new LinkedList<Map<String,String>>();
		for (int i = 0; i < 5; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("href", "/fadfa/faf");
			map.put("content", "fasdfadf");
			aList.add(map);
		}
		dataMap.put("aList", aList);
		
		//增加滚动新闻列表
		List<Map<String, String>> list_slide_news = new LinkedList<Map<String,String>>();
		for (int i = 0; i < 5; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("href", "#");
			map.put("src", "images/img"+(i+1)+".jpg");
			map.put("title", "标题1");
			map.put("content", "内容11111");
			list_slide_news.add(map);
		}
		dataMap.put("list_slide_news", list_slide_news);
		
		//增加技术前沿列表
		List<Map<String, String>> list_tech = new LinkedList<Map<String,String>>();
		for (int i = 0; i < 6; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("href", "#");
			map.put("title", "标题1111111111111");
			map.put("time", "08-12");
			list_tech.add(map);
		}
		dataMap.put("list_tech", list_tech);
		
		//增加政策解读列表1
		List<Map<String, String>> list_policy_1 = new LinkedList<Map<String,String>>();
		for (int i = 0; i < 3; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("href", "#");
			map.put("title", "标题1111111111111");
			map.put("time", "08-12");
			list_policy_1.add(map);
		}
		dataMap.put("list_policy_1", list_policy_1);
		
		//增加政策解读列表2
		List<Map<String, String>> list_policy_2 = new LinkedList<Map<String,String>>();
		for (int i = 0; i < 3; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("href", "#");
			map.put("title", "标题1111111111111");
			map.put("time", "08-12");
			list_policy_2.add(map);
		}
		dataMap.put("list_policy_2", list_policy_2);
		
		//增加一个单标签
		dataMap.put("title1", "新的标题吧");
		//////////////////////////////////////////////////////////
		
		dataMap.put("basePath", "http://localhost:8000/");
		FreeMarkerUtils.processTemplate("index.ftl", dataMap,
				"D://Projects//git//web_user_side//WebRoot//test.html");
		return "success";
	}

}
