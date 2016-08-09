package com.easycms.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgGovInfo;
import com.easycms.service.CmsOrgGovInfoService;

@Service
public class CmsOrgGovInfoServiceImpl extends AbstractBaseDao<CmsOrgGovInfo, Long> implements
		CmsOrgGovInfoService {


	@Override
	public void saveOrgGovInfo(CmsOrgGovInfo orgGovInfo) {
		// TODO Auto-generated method stub
		save(orgGovInfo);

	}

	@Override
	public CmsOrgGovInfo findOrgGovInfoById(long id) {
		// TODO Auto-generated method stub
		CmsOrgGovInfo cOrgGovInfo = findById(id);
		return cOrgGovInfo;
	}

	@Override
	public void updateOrgGovInfo(CmsOrgGovInfo orgGovInfo) {
		// TODO Auto-generated method stub
		update(orgGovInfo);
	}

	@Override
	public Pager<CmsOrgGovInfo> findOrgGovInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgGovInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
