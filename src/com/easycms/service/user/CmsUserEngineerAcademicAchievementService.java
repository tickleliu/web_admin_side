package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerAcademicAchievement;

public interface CmsUserEngineerAcademicAchievementService extends BaseDao<CmsUserEngineerAcademicAchievement, Long>{
	public void saveAchievement(CmsUserEngineerAcademicAchievement achievement);
	public CmsUserEngineerAcademicAchievement findAchievementById(long id);
	public void updateAchievement(CmsUserEngineerAcademicAchievement achievement);
	public Pager<CmsUserEngineerAcademicAchievement> findAchievementByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteAchievementById(long id);
}
