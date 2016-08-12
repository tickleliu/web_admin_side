package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerCertificate;

public interface CmsUserCertificateServiceImpl extends BaseDao<CmsUserEngineerCertificate, Long>{
	public void saveCertificate(CmsUserEngineerCertificate certificate);
	public CmsUserEngineerCertificate findCertificateById(long id);
	public void updateCertificate(CmsUserEngineerCertificate certificate);
	public Pager<CmsUserEngineerCertificate> findCertificatesByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteCertificateById(long id);
}
