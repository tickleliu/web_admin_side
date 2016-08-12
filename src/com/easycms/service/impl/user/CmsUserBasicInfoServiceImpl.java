package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserBasicInfo;

public interface CmsUserBasicInfoServiceImpl extends BaseDao<CmsUserBasicInfo, Long>{
	public void saveUserBasicInfoService(CmsUserBasicInfo info);
	public CmsUserBasicInfo findUserBasicInfoById(long id);
	public void updateUserBasicInfo(CmsUserBasicInfo article);
	public Pager<CmsUserBasicInfo> findUserBasicInfoByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserBasicInfoById(long id);
}
