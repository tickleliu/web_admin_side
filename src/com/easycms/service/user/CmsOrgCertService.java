package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgCert;

public interface CmsOrgCertService extends BaseDao<CmsOrgCert, Long>{
	public void saveOrgCert(CmsOrgCert orgCert);
	public CmsOrgCert findOrgCertById(long id);
	public void updateOrgCert(CmsOrgCert orgCert);
	public Pager<CmsOrgCert> findOrgCertsByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgCertById(long id);
}
