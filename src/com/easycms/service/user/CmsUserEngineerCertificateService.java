package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerCertificate;

public interface CmsUserEngineerCertificateService extends BaseDao<CmsUserEngineerCertificate, Long>{
	public void saveUserEngineerCertificate(CmsUserEngineerCertificate certificate);
	public CmsUserEngineerCertificate findUserEngineerCertificateById(long id);
	public void updateUserEngineerCertificate(CmsUserEngineerCertificate certificate);
	public Pager<CmsUserEngineerCertificate> findUserEngineerCertificatesByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserEngineerCertificateById(long id);
}
