package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserLoginInfo;
import com.easycms.service.user.CmsUserLoginInfoService;

@Service
public class CmsUserLoginInfoServiceImpl extends
		AbstractBaseDao<CmsUserLoginInfo, Long> implements
		CmsUserLoginInfoService {

	@Override
	public void saveUserLoginInfo(CmsUserLoginInfo info) {
		// TODO Auto-generated method stub
		save(info);

	}

	@Override
	public CmsUserLoginInfo findUserLoginInfoById(long id) {
		// TODO Auto-generated method stub
		return findById(id);
	}

	@Override
	public void updateUserLoginInfo(CmsUserLoginInfo userLoginInfo) {
		// TODO Auto-generated method stub
		update(userLoginInfo);

	}

	@Override
	public Pager<CmsUserLoginInfo> findUserLoginInfoByKey(
			Map<String, Object> map, int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserLoginInfoById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
