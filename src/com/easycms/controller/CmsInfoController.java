package com.easycms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class CmsInfoController {
	
	@RequestMapping("/intro_e.do")
	public String centerInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "editor";
	}

	@RequestMapping("/show")
	public String show(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("show called");
		return "show";
	}
	
}
