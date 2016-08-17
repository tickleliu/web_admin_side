package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserExperterProjInfo;

public interface CmsUserExperterProjInfoService extends BaseDao<CmsUserExperterProjInfo, Long>{
	public void saveUserExperterProjInfo(CmsUserExperterProjInfo info);
	public CmsUserExperterProjInfo findUserExperterProjInfoById(long id);
	public void updateUserExperterProjInfo(CmsUserExperterProjInfo info);
	public Pager<CmsUserExperterProjInfo> findUserExperterProjInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserExperterProjInfoById(long id);
}
