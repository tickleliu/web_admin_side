package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgEntInfo;

public interface CmsOrgEntInfoService extends BaseDao<CmsOrgEntInfo, Long>{
	public void saveOrgEntInfo(CmsOrgEntInfo orgEntInfo);
	public CmsOrgEntInfo findOrgEntInfoById(long id);
	public void updateOrgEntInfo(CmsOrgEntInfo orgEntInfo);
	public Pager<CmsOrgEntInfo> findOrgEntInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgEntInfoById(long id);

}
