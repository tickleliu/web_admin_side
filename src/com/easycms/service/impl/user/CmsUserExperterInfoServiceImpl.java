package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserExperterInfo;

public interface CmsUserExperterInfoServiceImpl extends BaseDao<CmsUserExperterInfo, Long>{
	public void saveExperterInfo(CmsUserExperterInfo experterInfo);
	public CmsUserExperterInfo findExperterInfoById(long id);
	public void updateExperterInfo(CmsUserExperterInfo experterInfo);
	public Pager<CmsUserExperterInfo> findExperterInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteExperterInfoById(long id);
}
