package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserExperterProjInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserExperterProjInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserExperterProjInfoTest {
	@Resource(name = "cmsUserExperterProjInfoServiceImpl")
	private CmsUserExperterProjInfoServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserExperterProjInfo cmsBasicInfo= us.findUserExperterProjInfoById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserExperterProjInfo();
			cmsBasicInfo.setProject_id(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserExperterProjInfoById(longR);
		}
		System.out.println(cmsBasicInfo.getProject_id());
		cmsBasicInfo.setContribution("test");
		us.updateUserExperterProjInfo(cmsBasicInfo);
		cmsBasicInfo = us.findUserExperterProjInfoById(longR);
		System.out.println(cmsBasicInfo.getContribution());
		us.deleteUserExperterProjInfoById(longR);
		if(us.findUserExperterProjInfoById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
