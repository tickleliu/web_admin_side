package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgLegBranches;
import com.easycms.service.user.CmsOrgLegBranchesService;

@Service
public class CmsOrgLegBranchesServiceImpl extends AbstractBaseDao<CmsOrgLegBranches, Long> implements
		CmsOrgLegBranchesService {


	@Override
	public void saveOrgLegBranches(CmsOrgLegBranches orgLegBranches) {
		// TODO Auto-generated method stub
		save(orgLegBranches);

	}

	@Override
	public CmsOrgLegBranches findOrgLegBranchesById(long id) {
		// TODO Auto-generated method stub
		CmsOrgLegBranches cOrgLegBranches = findById(id);
		return cOrgLegBranches;
	}

	@Override
	public void updateOrgLegBranches(CmsOrgLegBranches orgLegBranches) {
		// TODO Auto-generated method stub
		update(orgLegBranches);
	}

	@Override
	public Pager<CmsOrgLegBranches> findOrgLegBranchessByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgLegBranchesById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
