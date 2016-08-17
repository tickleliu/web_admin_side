package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserLoginInfo;

public interface CmsUserLoginInfoService  extends BaseDao<CmsUserLoginInfo, Long>{
	public void saveUserLoginInfo(CmsUserLoginInfo info);
	public CmsUserLoginInfo findUserLoginInfoById(long id);
	public void updateUserLoginInfo(CmsUserLoginInfo userLoginInfo);
	public Pager<CmsUserLoginInfo> findUserLoginInfoByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserLoginInfoById(long id);
}
