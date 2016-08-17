package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerWorkLife;

public interface CmsUserEngineerWorkLifeService extends BaseDao<CmsUserEngineerWorkLife, Long>{
	public void saveUserEngineerWorkLife(CmsUserEngineerWorkLife workLife);
	public CmsUserEngineerWorkLife findUserEngineerWorkLifeById(long id);
	public void updateUserEngineerWorkLife(CmsUserEngineerWorkLife workLife);
	public Pager<CmsUserEngineerWorkLife> findUserEngineerWorkLifesByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserEngineerWorkLifeById(long id);
}
