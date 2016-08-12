package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgLegProject;

public interface CmsOrgLegProjectService extends BaseDao<CmsOrgLegProject, Long>{
	public void saveOrgLegProject(CmsOrgLegProject orgLegProject);
	public CmsOrgLegProject findOrgLegProjectById(long id);
	public void updateOrgLegProject(CmsOrgLegProject orgLegProject);
	public Pager<CmsOrgLegProject> findOrgLegProjectsByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgLegProjectById(long id);

}
