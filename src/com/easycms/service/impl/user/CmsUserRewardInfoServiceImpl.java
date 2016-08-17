package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserRewardInfo;
import com.easycms.service.user.CmsUserRewardInfoService;

@Service
public class CmsUserRewardInfoServiceImpl extends AbstractBaseDao<CmsUserRewardInfo, Long> implements
		CmsUserRewardInfoService {


	@Override
	public void saveUserRewardInfo(CmsUserRewardInfo reward) {
		// TODO Auto-generated method stub
		save(reward);

	}

	@Override
	public CmsUserRewardInfo findUserRewardInfoById(long id) {
		// TODO Auto-generated method stub
		CmsUserRewardInfo cUserRewardInfo = findById(id);
		return cUserRewardInfo;
	}

	@Override
	public void updateUserRewardInfo(CmsUserRewardInfo reward) {
		// TODO Auto-generated method stub
		update(reward);
	}

	@Override
	public Pager<CmsUserRewardInfo> findUserRewardInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserRewardInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

