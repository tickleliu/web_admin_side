package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgSupplyDemand;

public interface CmsOrgSupplyDemandService extends BaseDao<CmsOrgSupplyDemand, Long>{
	public void saveOrgSupplyDemand(CmsOrgSupplyDemand orgSupplyDemand);
	public CmsOrgSupplyDemand findOrgSupplyDemandById(long id);
	public void updateOrgSupplyDemand(CmsOrgSupplyDemand orgSupplyDemand);
	public Pager<CmsOrgSupplyDemand> findOrgSupplyDemandsByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgSupplyDemandById(long id);

}
