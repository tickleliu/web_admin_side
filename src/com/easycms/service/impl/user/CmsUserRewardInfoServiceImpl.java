package com.easycms.service.impl.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserRewardInfo;

public interface CmsUserRewardInfoServiceImpl extends BaseDao<CmsUserRewardInfo, Long>{
	public void saveRewardInfo(CmsUserRewardInfo article);
	public CmsUserRewardInfo findRewardInfoById(long id);
	public void updateRewardInfo(CmsUserRewardInfo rewardInfo);
	public Pager<CmsUserRewardInfo> findRewardInfosByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteRewardInfoById(long id);
}
