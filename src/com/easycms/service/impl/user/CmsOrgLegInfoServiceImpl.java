package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgLegInfo;
import com.easycms.service.user.CmsOrgLegInfoService;

@Service
public class CmsOrgLegInfoServiceImpl extends AbstractBaseDao<CmsOrgLegInfo, Long> implements
		CmsOrgLegInfoService {


	@Override
	public void saveOrgLegInfo(CmsOrgLegInfo orgLegInfo) {
		// TODO Auto-generated method stub
		save(orgLegInfo);

	}

	@Override
	public CmsOrgLegInfo findOrgLegInfoById(long id) {
		// TODO Auto-generated method stub
		CmsOrgLegInfo cOrgLegInfo = findById(id);
		return cOrgLegInfo;
	}

	@Override
	public void updateOrgLegInfo(CmsOrgLegInfo orgLegInfo) {
		// TODO Auto-generated method stub
		update(orgLegInfo);
	}

	@Override
	public Pager<CmsOrgLegInfo> findOrgLegInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgLegInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
