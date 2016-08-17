package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserExperterInfo;

public interface CmsUserExperterInfoService extends BaseDao<CmsUserExperterInfo, Long>{
	public void saveUserExperterInfo(CmsUserExperterInfo info);
	public CmsUserExperterInfo findUserExperterInfoById(long id);
	public void updateUserExperterInfo(CmsUserExperterInfo info);
	public Pager<CmsUserExperterInfo> findUserExperterInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserExperterInfoById(long id);
}
