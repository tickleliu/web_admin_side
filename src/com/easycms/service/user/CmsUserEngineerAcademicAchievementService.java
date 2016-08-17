package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerAcademicAchievement;

public interface CmsUserEngineerAcademicAchievementService extends BaseDao<CmsUserEngineerAcademicAchievement, Long>{
	public void saveUserEngineerAcademicAchievement(CmsUserEngineerAcademicAchievement achievement);
	public CmsUserEngineerAcademicAchievement findUserEngineerAcademicAchievementById(long id);
	public void updateUserEngineerAcademicAchievement(CmsUserEngineerAcademicAchievement achievement);
	public Pager<CmsUserEngineerAcademicAchievement> findUserEngineerAcademicAchievementsByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteUserEngineerAcademicAchievementById(long id);
}
