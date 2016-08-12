package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserExperterProjInfo;

public interface CmsUserProjInfoServiceImpl extends BaseDao<CmsUserExperterProjInfo, Long>{
	public void saveProjInfo(CmsUserExperterProjInfo porjInfo);
	public CmsUserExperterProjInfo findProjInfoById(long id);
	public void updateProjInfo(CmsUserExperterProjInfo projInfo);
	public Pager<CmsUserExperterProjInfo > findProjInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteProjInfoById(long id);
}
