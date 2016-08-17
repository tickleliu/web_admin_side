package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerWorkLife;
import com.easycms.service.user.CmsUserEngineerWorkLifeService;

@Service
public class CmsUserEngineerWorkLifeServiceImpl extends AbstractBaseDao<CmsUserEngineerWorkLife, Long> implements
		CmsUserEngineerWorkLifeService {


	@Override
	public void saveUserEngineerWorkLife(CmsUserEngineerWorkLife workLife) {
		// TODO Auto-generated method stub
		save(workLife);

	}

	@Override
	public CmsUserEngineerWorkLife findUserEngineerWorkLifeById(long id) {
		// TODO Auto-generated method stub
		CmsUserEngineerWorkLife cUserEngineerWorkLife = findById(id);
		return cUserEngineerWorkLife;
	}

	@Override
	public void updateUserEngineerWorkLife(CmsUserEngineerWorkLife workLife) {
		// TODO Auto-generated method stub
		update(workLife);
	}

	@Override
	public Pager<CmsUserEngineerWorkLife> findUserEngineerWorkLifesByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserEngineerWorkLifeById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

