package com.easycms.service;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgLegInfo;

public interface CmsOrgLegInfoService extends BaseDao<CmsOrgLegInfo, Long>{
	public void saveOrgLegInfo(CmsOrgLegInfo orgLegInfo);
	public CmsOrgLegInfo findOrgLegInfoById(long id);
	public void updateOrgLegInfo(CmsOrgLegInfo orgLegInfo);
	public Pager<CmsOrgLegInfo> findOrgLegInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgLegInfoById(long id);

}
