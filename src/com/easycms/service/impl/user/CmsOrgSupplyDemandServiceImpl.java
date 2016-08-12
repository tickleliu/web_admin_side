package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgSupplyDemand;
import com.easycms.service.user.CmsOrgSupplyDemandService;

@Service
public class CmsOrgSupplyDemandServiceImpl extends AbstractBaseDao<CmsOrgSupplyDemand, Long> implements
		CmsOrgSupplyDemandService {


	@Override
	public void saveOrgSupplyDemand(CmsOrgSupplyDemand orgSupplyDemand) {
		// TODO Auto-generated method stub
		save(orgSupplyDemand);

	}

	@Override
	public CmsOrgSupplyDemand findOrgSupplyDemandById(long id) {
		// TODO Auto-generated method stub
		CmsOrgSupplyDemand cOrgSupplyDemand = findById(id);
		return cOrgSupplyDemand;
	}

	@Override
	public void updateOrgSupplyDemand(CmsOrgSupplyDemand orgSupplyDemand) {
		// TODO Auto-generated method stub
		update(orgSupplyDemand);
	}

	@Override
	public Pager<CmsOrgSupplyDemand> findOrgSupplyDemandsByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgSupplyDemandById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
