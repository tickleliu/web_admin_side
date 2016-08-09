package com.easycms.service;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgLegBranches;

public interface CmsOrgLegBranchesService extends BaseDao<CmsOrgLegBranches, Long>{
	public void saveOrgLegBranches(CmsOrgLegBranches orgLegBranches);
	public CmsOrgLegBranches findOrgLegBranchesById(long id);
	public void updateOrgLegBranches(CmsOrgLegBranches article);
	public Pager<CmsOrgLegBranches> findOrgLegBranchessByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgLegBranchesById(long id);

}
