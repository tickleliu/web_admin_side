package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserEngineerImportantWork;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserEngineerImportantWorkServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserEngineerImportantWorkTest {
	@Resource(name = "cmsUserEngineerImportantWorkServiceImpl")
	private CmsUserEngineerImportantWorkServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserEngineerImportantWork cmsBasicInfo= us.findUserEngineerImportantWorkById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserEngineerImportantWork();
			cmsBasicInfo.setWork_id(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserEngineerImportantWorkById(longR);
		}
		System.out.println(cmsBasicInfo.getWork_id());
		cmsBasicInfo.setWork_name("test");
		us.updateUserEngineerImportantWork(cmsBasicInfo);
		cmsBasicInfo = us.findUserEngineerImportantWorkById(longR);
		System.out.println(cmsBasicInfo.getWork_name());
		us.deleteUserEngineerImportantWorkById(longR);
		if(us.findUserEngineerImportantWorkById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
