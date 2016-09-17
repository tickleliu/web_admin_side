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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycms.common.DateUtil;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserBasicInfo;
import com.easycms.entity.user.CmsUserLoginInfo;
import com.easycms.entity.user.CmsUserRoleInfo;
import com.easycms.service.impl.user.CmsUserBasicInfoServiceImpl;
import com.easycms.service.impl.user.CmsUserLoginInfoServiceImpl;
import com.easycms.service.impl.user.CmsUserRoleServiceImpl;

@Controller
@RequestMapping(value = "/user")
public class CmsUserController {

	static final String[] Statuses = { "无效用户", "有效用户", "注销用户", "异常用户" };

	@Resource(name = "cmsUserLoginInfoServiceImpl")
	CmsUserLoginInfoServiceImpl uls;

	@Resource(name = "cmsUserRoleServiceImpl")
	CmsUserRoleServiceImpl urs;

	@Resource(name = "cmsUserBasicInfoServiceImpl")
	CmsUserBasicInfoServiceImpl ubis;
	
	/**
	 * 用户登录信息管理页
	 * */
	@RequestMapping(value = "/sul")
	public String showUserListPage(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		model.addAttribute("status", Statuses);
		return "user/user_basic_list_show";
	}

	/**
	 * 根据搜索条件，获得用户登录信息
	 * */
	@RequestMapping(value = "/user_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserInfos(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("datefrom");
		if (datefrom != null && !datefrom.equals("")) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dateto");
		if (dateto != null && !dateto.equals("")) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String uwechatid = request.getParameter("wechat_id");
		if (uwechatid != null) {
			map.put("uwechatid", uwechatid);
		}

		String username = request.getParameter("name");
		if (username != null) {
			map.put("username", username);
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

		String statusString = request.getParameter("status");
		Integer status = 0;
		if (statusString != null) {
			try {
				status = Integer.parseInt(statusString);
				status = status - 1;
			} catch (NumberFormatException e) {
				// TODO: handle exception
				status = 0;
			}

			if (status >= 0 && status < Statuses.length) {
				map.put("status", status);
			} else {
				status = 0;
			}
		}

		Pager<CmsUserLoginInfo> pager = uls.findUserLoginInfoByKey(map,
				showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> users = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		Random random = new Random();
		for (int i = 0; i < pager.getPageList().size(); i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", pager.getPageList().get(i).getUid());
			jsonMap.put("name", pager.getPageList().get(i).getUsername());
			jsonMap.put("wechat_id", pager.getPageList().get(i).getUwechatid());
			String regis_time = DateFormatUtils.format(
					pager.getPageList().get(i).getCreate_time(), "yyyy-MM-dd");
			jsonMap.put("regis_time", regis_time);
			if (pager.getPageList().get(i).getStatus() >= 0
					&& pager.getPageList().get(i).getStatus() < Statuses.length) {
				jsonMap.put("status", Statuses[pager.getPageList().get(i)
						.getStatus()]);
			} else {
				jsonMap.put("status", Statuses[0]);
			}
			jsonMap.put("image_url", pager.getPageList().get(i).getHead_image());

			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}

	/**
	 * 用户登录信息删除页
	 * */
	@RequestMapping(value = "/user_d")
	@ResponseBody
	public String deleteInfoResult(@RequestBody String deleteIds,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		JSONObject jsonObject = new JSONObject(deleteIds);
		JSONArray jsonArray = jsonObject.getJSONArray("deleteIds");

		JSONObject jsonObject2 = new JSONObject();

		int length = jsonArray.length();
		for (int i = 0; i < length; i++) {
			try {
				Long uid = jsonArray.getLong(i);
				System.out.println(uid);
				uls.deleteUserLoginInfoById(uid);
			} catch (Exception e) {
				// TODO: handle exception

				jsonObject2.put("result", "error");
			}
		}

		jsonObject2.put("result", "success");
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		return jsonObject2.toString();
	}

	/**
	 * 用户角色信息管理页面
	 * */
	@RequestMapping(value = "sur")
	public String showUserRoles(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "user/user_role_list_show";
	}

	/**
	 * 用户角色信息获取
	 * */
	@RequestMapping(value = "/userrole_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserRoles(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("dfrom");
		if (datefrom != null) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dto");
		if (dateto != null) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String username = request.getParameter("name");
		Pager<CmsUserLoginInfo> userLoginPager = null;
		if (username != null && !username.equals("")) {
			map.put("username", username);
			userLoginPager = uls.findUserLoginInfoByKey(map, 0, 1);
			if (userLoginPager.getPageList() != null
					&& userLoginPager.getPageList().size() >= 1) {
				map.put("uid", userLoginPager.getPageList().get(0).getUid());
			}
		}

		String issuperadmin = request.getParameter("superadmin");
		if (issuperadmin != null
				&& (issuperadmin.equals("on") || issuperadmin.equals("true"))) {
			map.put("issuperadmin", 1);
		}

		String isorg = request.getParameter("persional");
		if (isorg != null && (isorg.equals("on") || isorg.equals("true"))) {
			map.put("isorg", 1);
		}

		String isadmin = request.getParameter("admin");
		if (isadmin != null
				&& (isadmin.equals("on") || isadmin.equals("true"))) {
			map.put("isadmin", 1);
		}

		String isexperter = request.getParameter("expert");
		if (isexperter != null
				&& (isexperter.equals("on") || isexperter.equals("true"))) {
			map.put("isexperter", 1);
		}

		String ismanager = request.getParameter("leader");
		if (ismanager != null
				&& (ismanager.equals("on") || ismanager.equals("true"))) {
			map.put("ismanager", 1);
		}

		String isengineer = request.getParameter("tech");
		if (isengineer != null
				&& (isengineer.equals("on") || isengineer.equals("true"))) {
			map.put("isengineer", 1);
		}

		String isent = request.getParameter("firm");
		if (isent != null && (isent.equals("on") || isent.equals("true"))) {
			map.put("isent", 1);
		}

		String isgov = request.getParameter("region");
		if (isgov != null && (isgov.equals("on") || isgov.equals("true"))) {
			map.put("isgov", 1);
		}

		String isleg = request.getParameter("member");
		if (isleg != null && (isleg.equals("on") || isleg.equals("true"))) {
			map.put("isleg", 1);
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

		JSONObject jsonObject = new JSONObject();

		Pager<CmsUserRoleInfo> pager = urs.findUserRolesByKey(map, showPages,
				pageSize);

		jsonObject.put("total", pager.getTotal());
		List<HashedMap> articles = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < pager.getPageList().size(); i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", pager.getPageList().get(i).getUid());
			CmsUserLoginInfo cmsUserLoginInfo = uls.findUserLoginInfoById(pager
					.getPageList().get(i).getUid());
			jsonMap.put("name", cmsUserLoginInfo.getUsername());
			
			if(pager.getPageList().get(i).getIssuperadmin().equals(1)) {
				jsonMap.put("superadmin", "是");
			} else {
				jsonMap.put("superadmin", "否");
			}
			
			if(pager.getPageList().get(i).getIsadmin().equals(1)) {
				jsonMap.put("admin", "是");
			} else {
				jsonMap.put("admin", "否");
			}
			
			if(pager.getPageList().get(i).getIsorg().equals(1)) {
				jsonMap.put("personal", "是");
			} else {
				jsonMap.put("personal", "否");
			}
			
			if(pager.getPageList().get(i).getIsexperter().equals(1)) {
				jsonMap.put("expert", "是");
			} else {
				jsonMap.put("expert", "否");
			}
			
			if(pager.getPageList().get(i).getIsengineer().equals(1)) {
				jsonMap.put("tech", "是");
			} else {
				jsonMap.put("tech", "否");
			}
			
			if(pager.getPageList().get(i).getIsmanager().equals(1)) {
				jsonMap.put("leader", "是");
			} else {
				jsonMap.put("leader", "否");
			}
			
			if(pager.getPageList().get(i).getIsent().equals(1)) {
				jsonMap.put("firm", "是");
			} else {
				jsonMap.put("firm", "否");
			}
			
			if(pager.getPageList().get(i).getIsgov().equals(1)) {
				jsonMap.put("region", "是");
			} else {
				jsonMap.put("region", "否");
			}
			
			if(pager.getPageList().get(i).getIsleg().equals(1)) {
				jsonMap.put("member", "是");
			} else {
				jsonMap.put("member", "否");
			}
			
			String regis_time = DateFormatUtils
					.format(cmsUserLoginInfo.getCreate_time(), "yyyy-MM-dd");
			jsonMap.put("time", regis_time);
			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}

	/**
	 * 用户角色信息删除页
	 * */
	@RequestMapping(value = "/userrole_d")
	@ResponseBody
	public String deleteUserRoleResult(@RequestBody String deleteIds,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		JSONObject jsonObject = new JSONObject(deleteIds);
		JSONArray jsonArray = jsonObject.getJSONArray("deleteIds");

		JSONObject jsonObject2 = new JSONObject();

		int length = jsonArray.length();
		for (int i = 0; i < length; i++) {
			try {
				Long uid = jsonArray.getLong(i);
				System.out.println(uid);
				uls.deleteUserLoginInfoById(uid);
			} catch (Exception e) {
				// TODO: handle exception

				jsonObject2.put("result", "error");
			}
		}

		jsonObject2.put("result", "success");
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		return jsonObject2.toString();
	}
	
	/**
	 * 用户基本信息管理页
	 * */
	@RequestMapping(value = "sui")
	public String showUserBasicInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "user/personal_user_list_show";
	}
	
	/**
	 * 获得用户的基本信息
	 * */
	@RequestMapping(value = "/userrole_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserBasicInfos(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();
		String datefrom = request.getParameter("dfrom");
		if (datefrom != null) {
			try {
				map.put("datefrom", DateUtil.reformatDateString(datefrom,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String dateto = request.getParameter("dto");
		if (dateto != null) {
			try {
				map.put("dateto", DateUtil.reformatDateString(dateto,
						"yyyy-MM-dd", "yyyy-MM-dd"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String username = request.getParameter("nickname");
		Pager<CmsUserLoginInfo> userLoginPager = null;
		if (username != null && !username.equals("")) {
			map.put("username", username);
			userLoginPager = uls.findUserLoginInfoByKey(map, 0, 1);
			if (userLoginPager.getPageList() != null
					&& userLoginPager.getPageList().size() >= 1) {
				map.put("uid", userLoginPager.getPageList().get(0).getUid());
			}
		}

		String realname = request.getParameter("realname");
		if (realname != null
				&& !realname.equals("")) {
			map.put("realname", realname);
		}
		
		String idcard_number = request.getParameter("idcard_number");
		if (idcard_number!= null
				&& !idcard_number.equals("")) {
			map.put("idcard_number", idcard_number);
		}
		
		String sex = request.getParameter("gender");
		if (sex!= null
				&& !sex.equals("")) {
			if(sex.equals("男")) {
				sex = "1";
			} else  {
				sex = "2";
			}
			map.put("sex", sex);
		}
		
		String culture_degree = request.getParameter("degree");
		if (culture_degree != null
				&& !culture_degree.equals("")) {
			map.put("culture_degree", culture_degree);
		}
		
		String specialty = request.getParameter("major");
		if (specialty != null
				&& !specialty.equals("")) {
			map.put("specialty", specialty);
		}
		
		String work_unit = request.getParameter("workunit");
		if (work_unit!= null
				&& !work_unit.equals("")) {
			map.put("work_unit", work_unit);
		}
		
		String position_level = request.getParameter("position");
		if (position_level!= null
				&& !position_level.equals("")) {
			map.put("position_level", position_level);
		}

		String phone = request.getParameter("phone");
		if (phone != null
				&& !phone.equals("")) {
			map.put("phone", phone);
		}

		String email = request.getParameter("email");
		if (email != null
				&& !email.equals("")) {
			map.put("email", email);
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

		JSONObject jsonObject = new JSONObject();

		Pager<CmsUserBasicInfo> pager = ubis.findUserBasicInfosByKey(map, showPages,
				pageSize);

		jsonObject.put("total", pager.getTotal());
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < pager.getPageList().size(); i++) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", pager.getPageList().get(i).getUid());
			CmsUserLoginInfo cmsUserLoginInfo = uls.findUserLoginInfoById(pager
					.getPageList().get(i).getUid());
			CmsUserBasicInfo cmsUserBasicInfo = pager.getPageList().get(i);
			jsonMap.put("nickname", cmsUserLoginInfo.getUsername());
			
			String regis_time = DateFormatUtils
					.format(cmsUserLoginInfo.getCreate_time(), "yyyy-MM-dd");
			jsonMap.put("time", regis_time);
			
			jsonMap.put("realname", cmsUserBasicInfo.getRealname());
			jsonMap.put("id_number", cmsUserBasicInfo.getIdcard_number());
			jsonMap.put("gender", cmsUserBasicInfo.getSex());
			jsonMap.put("degree", cmsUserBasicInfo.getCulture_degree());
			jsonMap.put("major", cmsUserBasicInfo.getSpecialty());
			jsonMap.put("workunit", cmsUserBasicInfo.getWork_unit());
			jsonMap.put("position", cmsUserBasicInfo.getPosition_level());
			jsonMap.put("phone", cmsUserBasicInfo.getPhone());
			jsonMap.put("email", cmsUserBasicInfo.getEmail());

			jsonArray.put(jsonMap);
		}

		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	/**
	 * 组织角色信息管理页
	 * */
	@RequestMapping(value = "soi")
	public String showOrgBasicInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "user/organization_user_list_show";
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
				map.put("dateto", DateUtil.reformatDateString(dateto,
						"yyyy-MM-dd", "yyyy-MM-dd"));
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
