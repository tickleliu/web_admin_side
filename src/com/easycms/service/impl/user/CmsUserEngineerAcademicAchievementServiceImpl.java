package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerAcademicAchievement;
import com.easycms.service.user.CmsUserEngineerAcademicAchievementService;

@Service
public class CmsUserEngineerAcademicAchievementServiceImpl extends AbstractBaseDao<CmsUserEngineerAcademicAchievement, Long> implements
		CmsUserEngineerAcademicAchievementService {


	@Override
	public void saveUserEngineerAcademicAchievement(CmsUserEngineerAcademicAchievement achievement) {
		// TODO Auto-generated method stub
		save(achievement);

	}

	@Override
	public CmsUserEngineerAcademicAchievement findUserEngineerAcademicAchievementById(long id) {
		// TODO Auto-generated method stub
		CmsUserEngineerAcademicAchievement cUserEngineerAcademicAchievement = findById(id);
		return cUserEngineerAcademicAchievement;
	}

	@Override
	public void updateUserEngineerAcademicAchievement(CmsUserEngineerAcademicAchievement achievement) {
		// TODO Auto-generated method stub
		update(achievement);
	}

	@Override
	public Pager<CmsUserEngineerAcademicAchievement> findUserEngineerAcademicAchievementsByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserEngineerAcademicAchievementById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

