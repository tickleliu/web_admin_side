package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerInfo;

public interface CmsUserEngineerService extends BaseDao<CmsUserEngineerInfo, Long>{
	public void saveEngineer(CmsUserEngineerInfo engineerInfo);
	public CmsUserEngineerInfo findEngineerById(long id);
	public void updateEngineer(CmsUserEngineerInfo engineerInfo);
	public Pager<CmsUserEngineerInfo> findEngineersByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteEngineerById(long id);

}
