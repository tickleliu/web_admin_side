package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserExperterInfo;
import com.easycms.service.user.CmsUserExperterInfoService;

@Service
public class CmsUserExperterInfoServiceImpl extends AbstractBaseDao<CmsUserExperterInfo, Long> implements
		CmsUserExperterInfoService {


	@Override
	public void saveUserExperterInfo(CmsUserExperterInfo info) {
		// TODO Auto-generated method stub
		save(info);

	}

	@Override
	public CmsUserExperterInfo findUserExperterInfoById(long id) {
		// TODO Auto-generated method stub
		CmsUserExperterInfo cUserExperterInfo = findById(id);
		return cUserExperterInfo;
	}

	@Override
	public void updateUserExperterInfo(CmsUserExperterInfo info) {
		// TODO Auto-generated method stub
		update(info);
	}

	@Override
	public Pager<CmsUserExperterInfo> findUserExperterInfosByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserExperterInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

