package com.easycms.realm;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserLoginInfo;
import com.easycms.entity.user.CmsUserRoleInfo;
import com.easycms.service.impl.user.CmsUserLoginInfoServiceImpl;
import com.easycms.service.impl.user.CmsUserRoleServiceImpl;

public class CmsUserRealm extends AuthorizingRealm {

	Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private CmsUserLoginInfoServiceImpl userLoginInfo;

	@Resource
	private CmsUserRoleServiceImpl userRoleInfo;

	public CmsUserLoginInfoServiceImpl getUserService() {
		return userLoginInfo;
	}

	public void setUserService(CmsUserLoginInfoServiceImpl userLoginInfo) {
		this.userLoginInfo = userLoginInfo;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		// String username =
		String username = (String) arg0.getPrimaryPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		Pager<CmsUserLoginInfo> user = userLoginInfo.findUserLoginInfoByKey(
				map, 0, 1);
		if (user == null) {
			return null;
		} else {
			CmsUserRoleInfo role = userRoleInfo.findUserRoleById(user
					.getPageList().get(0).getUid());

			Set<String> roles = new HashSet<String>();
			if (role.getIsadmin() == 1) {
				roles.add("admin");
			}

			if (role.getIssuperadmin() == 1) {
				roles.add("super_admin");
			}
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.setRoles(roles);
			return info;
		}
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken arg0) throws AuthenticationException {
		// TODO Auto-generated method stub
		String username = (String) arg0.getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		Pager<CmsUserLoginInfo> user = userLoginInfo.findUserLoginInfoByKey(
				map, 0, 1);
		if (user == null) {
			return null;
		} else {
			logger.info("user:" + user.getPageList().get(0).getUsername()
					+ ",password:" + user.getPageList().get(0).getPassword());
			return new SimpleAuthenticationInfo(user.getPageList().get(0)
					.getUsername(), user.getPageList().get(0).getPassword()
					.toCharArray(), this.getClass().toString());
		}
	}
}
