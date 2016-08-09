package com.easycms.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgLegAwards;
import com.easycms.service.CmsOrgLegAwardsService;

@Service
public class CmsOrgLegAwardsServiceImpl extends AbstractBaseDao<CmsOrgLegAwards, Long> implements
		CmsOrgLegAwardsService {


	@Override
	public void saveOrgLegAwards(CmsOrgLegAwards orgLegAwards) {
		// TODO Auto-generated method stub
		save(orgLegAwards);

	}

	@Override
	public CmsOrgLegAwards findOrgLegAwardsById(long id) {
		// TODO Auto-generated method stub
		CmsOrgLegAwards cOrgLegAwards = findById(id);
		return cOrgLegAwards;
	}

	@Override
	public void updateOrgLegAwards(CmsOrgLegAwards orgLegAwards) {
		// TODO Auto-generated method stub
		update(orgLegAwards);
	}

	@Override
	public Pager<CmsOrgLegAwards> findOrgLegAwardssByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgLegAwardsById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
