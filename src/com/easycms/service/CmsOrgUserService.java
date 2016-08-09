package com.easycms.service;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgUser;

public interface CmsOrgUserService extends BaseDao<CmsOrgUser, Long>{
	public void saveOrgUser(CmsOrgUser article);
	public CmsOrgUser findOrgUserById(long id);
	public void updateOrgUser(CmsOrgUser article);
	public Pager<CmsOrgUser> findOrgUsersByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgUserById(long id);

}
