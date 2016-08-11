package com.easycms.controller;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/user")
public class CmsUserController1 {
	
	@RequestMapping(value="/showUserList")
	public String showUserListPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "user/user_basic_list_show";
	}
	
	@RequestMapping(value="/getUserInfos")
	@ResponseBody
	public String getUserInfos(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "";
	}
}
