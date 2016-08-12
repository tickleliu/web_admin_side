package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserRoleInfo;

public interface CmsUserRoleService extends BaseDao<CmsUserRoleInfo, Long>{
	public void saveUserRole(CmsUserRoleInfo userRoleInfo);
	public CmsUserRoleInfo findUserRoleById(long id);
	public void updateUserRole(CmsUserRoleInfo userRoleInfo);
	public Pager<CmsUserRoleInfo> findUserRolesByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserRoleById(long id);

}
