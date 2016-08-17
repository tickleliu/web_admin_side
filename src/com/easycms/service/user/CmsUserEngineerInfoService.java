package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerInfo;

public interface CmsUserEngineerInfoService extends BaseDao<CmsUserEngineerInfo, Long>{
	public void saveUserEngineerInfo(CmsUserEngineerInfo info);
	public CmsUserEngineerInfo findUserEngineerInfoById(long id);
	public void updateUserEngineerInfo(CmsUserEngineerInfo info);
	public Pager<CmsUserEngineerInfo> findUserEngineerInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserEngineerInfoById(long id);
}
