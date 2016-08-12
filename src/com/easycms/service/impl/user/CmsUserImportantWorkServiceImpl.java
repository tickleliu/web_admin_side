package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerImportantWork;

public interface CmsUserImportantWorkServiceImpl extends BaseDao<CmsUserEngineerImportantWork, Long>{
	public void saveImportantWork(CmsUserEngineerImportantWork importantWork);
	public CmsUserEngineerImportantWork findImportantWorkById(long id);
	public void updateImportantWork(CmsUserEngineerImportantWork importantWork);
	public Pager<CmsUserEngineerImportantWork> findImportantWorksByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteImportantWorkById(long id);
}
