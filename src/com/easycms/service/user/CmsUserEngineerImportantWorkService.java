package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerImportantWork;

public interface CmsUserEngineerImportantWorkService extends BaseDao<CmsUserEngineerImportantWork, Long>{
	public void saveUserEngineerImportantWork(CmsUserEngineerImportantWork work);
	public CmsUserEngineerImportantWork findUserEngineerImportantWorkById(long id);
	public void updateUserEngineerImportantWork(CmsUserEngineerImportantWork work);
	public Pager<CmsUserEngineerImportantWork> findUserEngineerImportantWorksByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserEngineerImportantWorkById(long id);
}
