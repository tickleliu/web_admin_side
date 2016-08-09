package com.easycms.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgCert;
import com.easycms.service.CmsOrgCertService;

@Service
public class CmsOrgCertServiceImpl extends AbstractBaseDao<CmsOrgCert, Long> implements
		CmsOrgCertService {


	@Override
	public void saveOrgCert(CmsOrgCert orgCert) {
		// TODO Auto-generated method stub
		save(orgCert);

	}

	@Override
	public CmsOrgCert findOrgCertById(long id) {
		// TODO Auto-generated method stub
		CmsOrgCert cOrgCert = findById(id);
		return cOrgCert;
	}

	@Override
	public void updateOrgCert(CmsOrgCert orgCert) {
		// TODO Auto-generated method stub
		update(orgCert);
	}

	@Override
	public Pager<CmsOrgCert> findOrgCertsByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgCertById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
