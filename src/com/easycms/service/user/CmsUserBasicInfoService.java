package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserBasicInfo;

public interface CmsUserBasicInfoService extends BaseDao<CmsUserBasicInfo, Long>{
	public void saveUserBasicInfo(CmsUserBasicInfo info);
	public CmsUserBasicInfo findUserBasicInfoById(long id);
	public void updateUserBasicInfo(CmsUserBasicInfo info);
	public Pager<CmsUserBasicInfo> findUserBasicInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserBasicInfoById(long id);
}
