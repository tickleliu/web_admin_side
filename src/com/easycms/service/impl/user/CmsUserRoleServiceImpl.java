package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserRoleInfo;
import com.easycms.service.user.CmsUserRoleService;

@Service
public class CmsUserRoleServiceImpl extends AbstractBaseDao<CmsUserRoleInfo, Long>implements CmsUserRoleService{

	@Override
	public void saveUserRole(CmsUserRoleInfo userRoleInfo) {
		// TODO Auto-generated method stub
		save(userRoleInfo);
		
	}

	@Override
	public CmsUserRoleInfo findUserRoleById(long id) {
		// TODO Auto-generated method stub
		return findById(id);
	}

	@Override
	public void updateUserRole(CmsUserRoleInfo userRoleInfo) {
		// TODO Auto-generated method stub
		update(userRoleInfo);
		
	}

	@Override
	public Pager<CmsUserRoleInfo> findUserRolesByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");	
	}

	@Override
	public void deleteUserRoleById(long id) {
		// TODO Auto-generated method stub
		delete(id);
		
	}

}
