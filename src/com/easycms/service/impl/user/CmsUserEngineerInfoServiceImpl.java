package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerInfo;
import com.easycms.service.user.CmsUserEngineerInfoService;

@Service
public class CmsUserEngineerInfoServiceImpl extends AbstractBaseDao<CmsUserEngineerInfo, Long> implements
		CmsUserEngineerInfoService {


	@Override
	public void saveUserEngineerInfo(CmsUserEngineerInfo info) {
		// TODO Auto-generated method stub
		save(info);

	}

	@Override
	public CmsUserEngineerInfo findUserEngineerInfoById(long id) {
		// TODO Auto-generated method stub
		CmsUserEngineerInfo cUserEngineerInfo = findById(id);
		return cUserEngineerInfo;
	}

	@Override
	public void updateUserEngineerInfo(CmsUserEngineerInfo info) {
		// TODO Auto-generated method stub
		update(info);
	}

	@Override
	public Pager<CmsUserEngineerInfo> findUserEngineerInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserEngineerInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

