package com.easycms.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgEntInfo;
import com.easycms.service.CmsOrgEntInfoService;

@Service
public class CmsOrgEntInfoServiceImpl extends AbstractBaseDao<CmsOrgEntInfo, Long> implements
		CmsOrgEntInfoService {


	@Override
	public void saveOrgEntInfo(CmsOrgEntInfo orgEntInfo) {
		// TODO Auto-generated method stub
		save(orgEntInfo);

	}

	@Override
	public CmsOrgEntInfo findOrgEntInfoById(long id) {
		// TODO Auto-generated method stub
		CmsOrgEntInfo cOrgEntInfo = findById(id);
		return cOrgEntInfo;
	}

	@Override
	public void updateOrgEntInfo(CmsOrgEntInfo orgEntInfo) {
		// TODO Auto-generated method stub
		update(orgEntInfo);
	}

	@Override
	public Pager<CmsOrgEntInfo> findOrgEntInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgEntInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
