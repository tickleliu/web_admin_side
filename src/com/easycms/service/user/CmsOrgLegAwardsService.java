package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgLegAwards;

public interface CmsOrgLegAwardsService extends BaseDao<CmsOrgLegAwards, Long>{
	public void saveOrgLegAwards(CmsOrgLegAwards orgLegAwards);
	public CmsOrgLegAwards findOrgLegAwardsById(long id);
	public void updateOrgLegAwards(CmsOrgLegAwards article);
	public Pager<CmsOrgLegAwards> findOrgLegAwardssByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgLegAwardsById(long id);

}
