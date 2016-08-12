package com.easycms.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycms.common.FreeMarkerUtils;
import com.easycms.common.Pager;
import com.easycms.common.WebConfig;
import com.easycms.entity.CmsOrgCert;
import com.easycms.entity.CmsOrgEntInfo;
import com.easycms.entity.CmsOrgGovInfo;
import com.easycms.entity.CmsOrgLegAwards;
import com.easycms.entity.CmsOrgLegBranches;
import com.easycms.entity.CmsOrgLegInfo;
import com.easycms.entity.CmsOrgLegProject;
import com.easycms.entity.CmsOrgSupplyDemand;
import com.easycms.entity.CmsOrgUser;
import com.easycms.entity.CmsOrgUserAttachment;
import com.easycms.service.CmsOrgCertService;
import com.easycms.service.CmsOrgEntInfoService;
import com.easycms.service.CmsOrgGovInfoService;
import com.easycms.service.CmsOrgLegAwardsService;
import com.easycms.service.CmsOrgLegBranchesService;
import com.easycms.service.CmsOrgLegInfoService;
import com.easycms.service.CmsOrgLegProjectService;
import com.easycms.service.CmsOrgSupplyDemandService;
import com.easycms.service.CmsOrgUserAttachmentService;
import com.easycms.service.CmsOrgUserService;


@Controller
@RequestMapping("/test")
public class TestCmsOrgUserController {

	@Resource(name = "cmsOrgUserServiceImpl")
	private CmsOrgUserService ous;
	@Resource(name = "cmsOrgUserAttachmentServiceImpl")
	private CmsOrgUserAttachmentService ouas;
	@Resource(name = "cmsOrgCertServiceImpl")
	private CmsOrgCertService ocs;
	@Resource(name = "cmsOrgEntInfoServiceImpl")
	private CmsOrgEntInfoService oeis;
	@Resource(name = "cmsOrgGovInfoServiceImpl")
	private CmsOrgGovInfoService ogis;
	@Resource(name = "cmsOrgLegInfoServiceImpl")
	private CmsOrgLegInfoService olis;
	@Resource(name = "cmsOrgSupplyDemandServiceImpl")
	private CmsOrgSupplyDemandService osds;
	@Resource(name = "cmsOrgLegAwardsServiceImpl")
	private CmsOrgLegAwardsService olas;
	@Resource(name = "cmsOrgLegBranchesServiceImpl")
	private CmsOrgLegBranchesService olbs;
	@Resource(name = "cmsOrgLegProjectServiceImpl")
	private CmsOrgLegProjectService olps;

	@Resource(name = "webConfig")
	private WebConfig config;

	private static final Long CENTERINTRO_ID = 100L;
	private static final Long ORGINTRO_ID = 200L;
	private static final Long CONTACT_ID = 300L;

	private static final String[] CategoryStrings = { "新闻资讯", "政策解读", "技术前沿",
			"试点信息", "认证信息", "中心简介", "组织架构", "联系我们" };
	private static final String[] CategoryStringsE = { "news", "policy",
			"tech", "pilot", "identy", "intro", "org", "contact" };
	private Logger logger = Logger.getLogger(this.getClass());

	/**
	 * 基本情况
	 */

	/**
	 * 新闻管理列表生成 增加了中文数据处理
	 * */
	@RequestMapping(value = "/test_orgUser_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOrgUser(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
		}
		
		String enterprise_name = request.getParameter("enterprise_name");		
		List<String> enterprise_names = new LinkedList<String>();
		if (enterprise_name != null) {
			StringTokenizer stringTokenizer = new StringTokenizer(enterprise_name,
					" ,\t");
			while (stringTokenizer.hasMoreTokens()) {
				String tokenString = stringTokenizer.nextToken();
				if (tokenString.trim().length() > 0) {
					enterprise_names.add(tokenString.trim());
				}
			}
		}
		if (enterprise_names.size() > 0) {
			map.put("enterprise_name", enterprise_names);
		}
		
		String license_number = request.getParameter("license_number");
		if (license_number != null) {
			map.put("license_number", license_number);
		}
		String registered_capital_beyond = request.getParameter("registered_capital_beyond");
		if (registered_capital_beyond != null) {
			map.put("registered_capital_beyond", registered_capital_beyond);
		}
		String registered_capital_below = request.getParameter("registered_capital_below");
		if (registered_capital_below != null) {
			map.put("registered_capital_below", registered_capital_below);
		}
		String region = request.getParameter("region");
		if (region != null) {
			map.put("region", region);
		}		
		String enterprise_type = request.getParameter("enterprise_type");
		if (enterprise_type != null) {
			map.put("enterprise_type", enterprise_type);
		}
		
		String industry_fields = request.getParameter("industry_fields");
		List<String> industry_fieldses = new LinkedList<String>();
		if (industry_fields != null) {
			StringTokenizer stringTokenizer = new StringTokenizer(industry_fields,
					" ,\t");
			while (stringTokenizer.hasMoreTokens()) {
				String tokenString = stringTokenizer.nextToken();
				if (tokenString.trim().length() > 0) {
					industry_fieldses.add(tokenString.trim());
				}
			}
		}
		if (industry_fieldses.size() > 0) {
			map.put("industry_fields", industry_fieldses);
		}
		
		String contact_name = request.getParameter("contact_name");
		if (contact_name != null) {
			map.put("contact_name", contact_name);
		}		
		String phone = request.getParameter("phone");
		if (phone != null) {
			map.put("phone", phone);
		}
		String email = request.getParameter("email");
		if (email != null) {
			map.put("email", email);
		}
		String main_business = request.getParameter("main_business");
		List<String> main_businesses = new LinkedList<String>();
		if (main_business != null) {
			StringTokenizer stringTokenizer = new StringTokenizer(main_business,
					" ,\t");
			while (stringTokenizer.hasMoreTokens()) {
				String tokenString = stringTokenizer.nextToken();
				if (tokenString.trim().length() > 0) {
					main_businesses.add(tokenString.trim());
				}
			}
		}
		if (main_businesses.size() > 0) {
			map.put("main_business", main_businesses);
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

		Pager<CmsOrgUser> pager = ous
				.findOrgUsersByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgUser orgUser : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("uid", orgUser.getUid());
			jsonMap.put("enterprise_name", orgUser.getEnterprise_name());
			jsonMap.put("license_number", orgUser.getLicense_number());
			jsonMap.put("registered_capital", orgUser.getRegistered_capital());
			jsonMap.put("legal_representative", orgUser.getLegal_representative());
			jsonMap.put("region", orgUser.getRegion());
			jsonMap.put("address", orgUser.getAddress());
			jsonMap.put("zip_code", orgUser.getZip_code());
			jsonMap.put("enterprise_type", orgUser.getEnterprise_type());
			jsonMap.put("enterprise_nature", orgUser.getEnterprise_nature());
			jsonMap.put("industry_fields", orgUser.getIndustry_fields());
			jsonMap.put("web_site", orgUser.getWeb_site());
			jsonMap.put("contact_name", orgUser.getContact_name());
			jsonMap.put("contact_position", orgUser.getContact_position());
			jsonMap.put("phone", orgUser.getPhone());
			jsonMap.put("email", orgUser.getEmail());
			jsonMap.put("main_business", orgUser.getMain_business());
			jsonMap.put("resume", orgUser.getResume());

			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_attachment_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAttachment(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgUserAttachment> pager = ouas
				.findOrgUserAttachmentsByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgUserAttachment orgUserAttachment : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("attach_id", orgUserAttachment.getAttach_id());
			jsonMap.put("uid", orgUserAttachment.getUid());
			jsonMap.put("path", orgUserAttachment.getPath());
			jsonMap.put("title", orgUserAttachment.getTitle());
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_cert_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getCert(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgCert> pager = ocs
				.findOrgCertsByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgCert orgCert : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("attach_id", orgCert.getCert_id());
			jsonMap.put("uid", orgCert.getUid());
			jsonMap.put("name", orgCert.getName());
			jsonMap.put("level", orgCert.getLevel());
			String get_time = DateFormatUtils.format(
					orgCert.getGet_time(), "yyyy-MM-dd");
			jsonMap.put("get_time", get_time);
			String valid_time = DateFormatUtils.format(
					orgCert.getValid_time(), "yyyy-MM-dd");
			jsonMap.put("valid_time", valid_time);
			
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_entInfo_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getEntInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgEntInfo> pager = oeis
				.findOrgEntInfosByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgEntInfo orgEntInfo : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			
			jsonMap.put("uid", orgEntInfo.getUid());
			jsonMap.put("employees", orgEntInfo.getEmployees());
			jsonMap.put("sales", orgEntInfo.getSales());
			jsonMap.put("profits", orgEntInfo.getProfits());
			jsonMap.put("qualification", orgEntInfo.getQualification());
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_govInfo_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getGovInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgGovInfo> pager = ogis
				.findOrgGovInfosByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgGovInfo orgGovInfo : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			
			jsonMap.put("uid", orgGovInfo.getUid());
			jsonMap.put("gdp", orgGovInfo.getGdp());
			jsonMap.put("gdp_growth", orgGovInfo.getGdp_growth());
			jsonMap.put("military_gdp", orgGovInfo.getMilitary_gdp());
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_legInfo_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getLegInfo(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgLegInfo> pager = olis
				.findOrgLegInfosByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgLegInfo orgLegInfo : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			
			jsonMap.put("uid", orgLegInfo.getUid());
			jsonMap.put("technical_person_number", orgLegInfo.getTechnical_person_number());
			jsonMap.put("per_capital_output", orgLegInfo.getPer_capital_output());
			jsonMap.put("competent_authority", orgLegInfo.getCompetent_authority());
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_sd_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getSupplyDemand(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgSupplyDemand> pager = osds
				.findOrgSupplyDemandsByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgSupplyDemand orgSupplyDemand : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("sd_id", orgSupplyDemand.getSd_id());
			jsonMap.put("uid", orgSupplyDemand.getUid());
			jsonMap.put("isS_D", orgSupplyDemand.getIsS_D());
			jsonMap.put("title", orgSupplyDemand.getTitle());
			jsonMap.put("intro", orgSupplyDemand.getIntro());
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_legBranches_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getLegBranches(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgLegBranches> pager = olbs
				.findOrgLegBranchessByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgLegBranches orgLegBranches : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("branch_id", orgLegBranches.getBranch_id());
			jsonMap.put("uid", orgLegBranches.getUid());					
			jsonMap.put("title", orgLegBranches.getTitle());			
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_legProject_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getLegProject(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgLegProject> pager = olps
				.findOrgLegProjectsByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgLegProject orgLegProject : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("project_id", orgLegProject.getProject_id());
			jsonMap.put("uid", orgLegProject.getUid());
			String start_time = DateFormatUtils.format(
					orgLegProject.getStart_time(), "yyyy-MM-dd");
			jsonMap.put("start_time", start_time);
			String end_time = DateFormatUtils.format(
					orgLegProject.getEnd_time(), "yyyy-MM-dd");
			jsonMap.put("end_time", end_time);
			jsonMap.put("title", orgLegProject.getTitle());			
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/test_legAwards_g", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getLegAwards(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		Map<String, Object> map = new HashMap<String, Object>();		
	
		String uid = request.getParameter("uid");
		if (uid != null) {
			map.put("uid", uid);
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

		Pager<CmsOrgLegAwards> pager = olas
				.findOrgLegAwardssByKey(map, showPages, pageSize);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("total", pager.getTotal());
		List<HashedMap> orgUsers = new ArrayList<HashedMap>();
		JSONArray jsonArray = new JSONArray();

		for (CmsOrgLegAwards orgLegAwards : pager.getPageList()) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("award_id", orgLegAwards.getAward_id());
			jsonMap.put("uid", orgLegAwards.getUid());
			String get_time = DateFormatUtils.format(
					orgLegAwards.getGet_time(), "yyyy-MM-dd");
			jsonMap.put("get_time", get_time);			
			jsonMap.put("title", orgLegAwards.getTitle());			
			
			jsonArray.put(jsonMap);
		}
		jsonObject.put("rows", jsonArray);
		return jsonObject.toString();
	}

}
