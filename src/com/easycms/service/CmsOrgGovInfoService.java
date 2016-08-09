package com.easycms.service;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgGovInfo;

public interface CmsOrgGovInfoService extends BaseDao<CmsOrgGovInfo, Long>{
	public void saveOrgGovInfo(CmsOrgGovInfo orgGovInfo);
	public CmsOrgGovInfo findOrgGovInfoById(long id);
	public void updateOrgGovInfo(CmsOrgGovInfo orgGovInfo);
	public Pager<CmsOrgGovInfo> findOrgGovInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgGovInfoById(long id);

}
