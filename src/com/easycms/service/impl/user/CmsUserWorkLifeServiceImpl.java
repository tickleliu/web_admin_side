package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerWorkLife;

public interface CmsUserWorkLifeServiceImpl extends BaseDao<CmsUserEngineerWorkLife, Long>{
	public void saveWorkLife(CmsUserEngineerWorkLife workLife);
	public CmsUserEngineerWorkLife findWorkLifeById(long id);
	public void updateWorkLife(CmsUserEngineerWorkLife workLife);
	public Pager<CmsUserEngineerWorkLife> findWorkLifesByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteWorkLifeById(long id);

}
