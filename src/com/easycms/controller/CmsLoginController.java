package com.easycms.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easycms.common.CaptchaServlet;
import com.easycms.common.MD5;
import com.easycms.entity.CmsUser;
import com.easycms.entity.CmsUserExt;
import com.easycms.service.impl.user.CmsUserLoginInfoServiceImpl;

@Controller
@RequestMapping("/member")
public class CmsLoginController {
	private static final Logger logger = Logger
			.getLogger(CmsLoginController.class);
	@Resource(name = "cmsUserLoginInfoServiceImpl")
	private CmsUserLoginInfoServiceImpl userLoginInfo;

	// 登陆
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, ModelMap model,
			CmsUser user, String verifyCode) {
		String captcha = CaptchaServlet.getStoredCaptchaString(request);
		if (StringUtils.isNotBlank(captcha)) {
			if (captcha.equalsIgnoreCase(verifyCode)) {

				String username = request.getParameter("username");
				String password = request.getParameter("password");
				password = MD5.MD5Encode(password);
				logger.debug("user:" + username + ",password:"
						+ password);
				UsernamePasswordToken token = new UsernamePasswordToken(
						username, password.toCharArray(), false);
				Subject subject = SecurityUtils.getSubject();
				try {
					subject.login(token);
					logger.info("post into loginTo");
				} catch (AuthenticationException e) {
					// TODO: handle exception
					return "login";
				}
				return "index";

			} else {
				return "login";
			}
		} else {
			return "login";
		}

		// 验证码不能为空
		/*
		 * if(StringUtils.isNotBlank(captcha)){
		 * if(captcha.equalsIgnoreCase(verifyCode)) {
		 * user.setPassword(MD5.MD5Encode(user.getPassword()));
		 * user.setUsername(user.getUsername()); CmsUser cu = us.login(user);
		 * logger.info("登录密码："+cu.getUsername() +"用户名：" +cu.getPassword());
		 * HttpSession session = req.getSession(); session.setAttribute("user",
		 * cu); //设置session超时时间 //session.setMaxInactiveInterval(100); return
		 * "index"; }else{ return "login"; } }
		 */
		// return "login";
	}

	@RequestMapping(value = "/logoutpage", method = RequestMethod.GET)
	public String logoutpage() {
		return "login";
	}

	// 注销
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, ModelMap model) {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/member/logoutpage";
	}

	// 注册跳转链接
	@RequestMapping("/register")
	public String register(HttpServletRequest req, ModelMap model) {
		return "register";
	}

	// 用户注册操作
	@RequestMapping("/register.do")
	public String registerOperating(HttpServletRequest req, ModelMap model,
			CmsUser user, CmsUserExt userExt, Integer gid, String verifyCode) {
		String captcha = CaptchaServlet.getStoredCaptchaString(req);
		if (StringUtils.isNotBlank(captcha)) {
			if (captcha.equalsIgnoreCase(verifyCode)) {
				user.setGroup_id(gid);
				user.setPassword(MD5.MD5Encode(user.getPassword()));
				logger.info("有用户注册了 name={" + user.getUsername() + "}");
				return "login";
			} else {
				return "register";
			}
		} else {
			return "register";
		}
	}

	// 找回密码跳转链接
	@RequestMapping("/forgot")
	public String forgot(HttpServletRequest req, ModelMap model) {
		return "forgot";
	}

	// 找回密码操作
	@RequestMapping("/forgot.do")
	public String forgotOperating(HttpServletRequest req, ModelMap model) {
		return null;
	}
	
	@RequestMapping(value="/unauth")
	public String unauth(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "unauth";
	}
}
