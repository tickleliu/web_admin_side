package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserBasicInfo;
import com.easycms.service.user.CmsUserBasicInfoService;

@Service
public class CmsUserBasicInfoServiceImpl extends AbstractBaseDao<CmsUserBasicInfo, Long> implements
		CmsUserBasicInfoService {


	@Override
	public void saveUserBasicInfo(CmsUserBasicInfo basicInfo) {
		// TODO Auto-generated method stub
		save(basicInfo);

	}

	@Override
	public CmsUserBasicInfo findUserBasicInfoById(long id) {
		// TODO Auto-generated method stub
		CmsUserBasicInfo cUserBasicInfo = findById(id);
		return cUserBasicInfo;
	}

	@Override
	public void updateUserBasicInfo(CmsUserBasicInfo basicInfo) {
		// TODO Auto-generated method stub
		update(basicInfo);
	}

	@Override
	public Pager<CmsUserBasicInfo> findUserBasicInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserBasicInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
