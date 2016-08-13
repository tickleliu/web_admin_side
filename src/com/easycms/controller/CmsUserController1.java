package com.easycms.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.time.DateFormatUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycms.common.DateUtil;
import com.easycms.service.impl.user.CmsUserLoginInfoServiceImpl;

@Controller
@RequestMapping(value = "/user")
public class CmsUserController1 {
	
	@Resource(name = "cmsUserLoginInfoServiceImpl")
	CmsUserLoginInfoServiceImpl uls;

	@RequestMapping(value = "/showUserList")
	public String showUserListPage(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "user/user_basic_list_show";
	}

	@RequestMapping(value = "/user_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserInfos(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("datefrom");
		if (datefrom != null) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dateto");
		if (dateto != null) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto, "yyyy-MM-dd",
						"yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", 10);
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", random.nextLong());
			jsonMap.put("name", "testname");
			jsonMap.put("type", "普通");
			String regis_time = DateFormatUtils
					.format(new Date(), "yyyy-MM-dd");
			jsonMap.put("regis_time", regis_time);
			// jsonMap.put("update_time", article.getAid());
			jsonMap.put("wechat_id", random.nextLong());
			jsonMap.put("status", random.nextInt());
			jsonMap.put("image_url", "null");

			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value="showUserBasicInfo")
	public String showUserBasicInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "";
	}
	@RequestMapping(value = "/userbasic_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserBasicInfos(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("datefrom");
		if (datefrom != null) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dateto");
		if (dateto != null) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto, "yyyy-MM-dd",
						"yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", 10);
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", random.nextLong());
			jsonMap.put("name", "testname");
			jsonMap.put("type", "普通");
			String regis_time = DateFormatUtils
					.format(new Date(), "yyyy-MM-dd");
			jsonMap.put("regis_time", regis_time);
			// jsonMap.put("update_time", article.getAid());
			jsonMap.put("wechat_id", random.nextLong());
			jsonMap.put("status", random.nextInt());
			jsonMap.put("image_url", "null");

			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}

	@RequestMapping(value="showOrgBasicInfo")
	public String showOrgBasicInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "";
	}

	@RequestMapping(value = "/orgbasic_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOrgBasicInfos(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("datefrom");
		if (datefrom != null) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dateto");
		if (dateto != null) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto, "yyyy-MM-dd",
						"yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", 10);
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", random.nextLong());
			jsonMap.put("name", "testname");
			jsonMap.put("type", "普通");
			String regis_time = DateFormatUtils
					.format(new Date(), "yyyy-MM-dd");
			jsonMap.put("regis_time", regis_time);
			// jsonMap.put("update_time", article.getAid());
			jsonMap.put("wechat_id", random.nextLong());
			jsonMap.put("status", random.nextInt());
			jsonMap.put("image_url", "null");

			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value="showUserRole")
	public String showUserRole(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "";
	}

	@RequestMapping(value = "/userrole_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserRole(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("datefrom");
		if (datefrom != null) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dateto");
		if (dateto != null) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto, "yyyy-MM-dd",
						"yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", 10);
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", random.nextLong());
			jsonMap.put("name", "testname");
			jsonMap.put("type", "普通");
			String regis_time = DateFormatUtils
					.format(new Date(), "yyyy-MM-dd");
			jsonMap.put("regis_time", regis_time);
			// jsonMap.put("update_time", article.getAid());
			jsonMap.put("wechat_id", random.nextLong());
			jsonMap.put("status", random.nextInt());
			jsonMap.put("image_url", "null");

			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
}
