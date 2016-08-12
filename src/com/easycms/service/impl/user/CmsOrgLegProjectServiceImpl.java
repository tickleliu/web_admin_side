package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgLegProject;
import com.easycms.service.user.CmsOrgLegProjectService;

@Service
public class CmsOrgLegProjectServiceImpl extends AbstractBaseDao<CmsOrgLegProject, Long> implements
		CmsOrgLegProjectService {


	@Override
	public void saveOrgLegProject(CmsOrgLegProject orgLegProject) {
		// TODO Auto-generated method stub
		save(orgLegProject);

	}

	@Override
	public CmsOrgLegProject findOrgLegProjectById(long id) {
		// TODO Auto-generated method stub
		CmsOrgLegProject cOrgLegProject = findById(id);
		return cOrgLegProject;
	}

	@Override
	public void updateOrgLegProject(CmsOrgLegProject orgLegProject) {
		// TODO Auto-generated method stub
		update(orgLegProject);
	}

	@Override
	public Pager<CmsOrgLegProject> findOrgLegProjectsByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgLegProjectById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
