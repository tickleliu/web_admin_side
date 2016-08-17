package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserEngineerAcademicAchievement;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserEngineerAcademicAchievementServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CopyOfCmsUserEngineerWorkLifeTest {
	@Resource(name = "cmsUserEngineerAcademicAchievementServiceImpl")
	private CmsUserEngineerAcademicAchievementServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserEngineerAcademicAchievement cmsBasicInfo= us.findUserEngineerAcademicAchievementById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserEngineerAcademicAchievement();
			cmsBasicInfo.setAcademic_id(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserEngineerAcademicAchievementById(longR);
		}
		System.out.println(cmsBasicInfo.getAcademic_id());
		cmsBasicInfo.setName("test");
		us.updateUserEngineerAcademicAchievement(cmsBasicInfo);
		cmsBasicInfo = us.findUserEngineerAcademicAchievementById(longR);
		System.out.println(cmsBasicInfo.getName());
		us.deleteUserEngineerAcademicAchievementById(longR);
		if(us.findUserEngineerAcademicAchievementById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
