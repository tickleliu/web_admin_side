package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserEngineerWorkLife;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserEngineerWorkLifeServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserEngineerWorkLifeTest {
	@Resource(name = "cmsUserEngineerWorkLifeServiceImpl")
	private CmsUserEngineerWorkLifeServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserEngineerWorkLife cmsBasicInfo= us.findUserEngineerWorkLifeById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserEngineerWorkLife();
			cmsBasicInfo.setWork_life_id(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserEngineerWorkLifeById(longR);
		}
		System.out.println(cmsBasicInfo.getWork_life_id());
		cmsBasicInfo.setCompany("test");
		us.updateUserEngineerWorkLife(cmsBasicInfo);
		cmsBasicInfo = us.findUserEngineerWorkLifeById(longR);
		System.out.println(cmsBasicInfo.getCompany());
		us.deleteUserEngineerWorkLifeById(longR);
		if(us.findUserEngineerWorkLifeById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
