package com.easycms.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsOrgUser;
import com.easycms.service.CmsOrgUserService;

@Service
public class CmsOrgUserServiceImpl extends AbstractBaseDao<CmsOrgUser, Long> implements
		CmsOrgUserService {


	@Override
	public void saveOrgUser(CmsOrgUser orgUser) {
		// TODO Auto-generated method stub
		save(orgUser);

	}

	@Override
	public CmsOrgUser findOrgUserById(long id) {
		// TODO Auto-generated method stub
		CmsOrgUser cOrgUser = findById(id);
		return cOrgUser;
	}

	@Override
	public void updateOrgUser(CmsOrgUser orgUser) {
		// TODO Auto-generated method stub
		update(orgUser);
	}

	@Override
	public Pager<CmsOrgUser> findOrgUsersByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgUserById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
