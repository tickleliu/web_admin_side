package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerImportantWork;
import com.easycms.service.user.CmsUserEngineerImportantWorkService;

@Service
public class CmsUserEngineerImportantWorkServiceImpl extends AbstractBaseDao<CmsUserEngineerImportantWork, Long> implements
		CmsUserEngineerImportantWorkService {


	@Override
	public void saveUserEngineerImportantWork(CmsUserEngineerImportantWork work) {
		// TODO Auto-generated method stub
		save(work);

	}

	@Override
	public CmsUserEngineerImportantWork findUserEngineerImportantWorkById(long id) {
		// TODO Auto-generated method stub
		CmsUserEngineerImportantWork cUserEngineerImportantWork = findById(id);
		return cUserEngineerImportantWork;
	}

	@Override
	public void updateUserEngineerImportantWork(CmsUserEngineerImportantWork work) {
		// TODO Auto-generated method stub
		update(work);
	}

	@Override
	public Pager<CmsUserEngineerImportantWork> findUserEngineerImportantWorksByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserEngineerImportantWorkById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

