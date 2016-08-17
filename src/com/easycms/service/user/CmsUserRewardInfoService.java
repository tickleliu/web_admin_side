package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserRewardInfo;

public interface CmsUserRewardInfoService extends BaseDao<CmsUserRewardInfo, Long>{
	public void saveUserRewardInfo(CmsUserRewardInfo reward);
	public CmsUserRewardInfo findUserRewardInfoById(long id);
	public void updateUserRewardInfo(CmsUserRewardInfo reward);
	public Pager<CmsUserRewardInfo> findUserRewardInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserRewardInfoById(long id);
}
