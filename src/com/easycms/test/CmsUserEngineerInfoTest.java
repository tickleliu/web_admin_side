package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserEngineerInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserEngineerInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserEngineerInfoTest {
	@Resource(name = "cmsUserEngineerInfoServiceImpl")
	private CmsUserEngineerInfoServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserEngineerInfo cmsEngineerInfo= us.findUserEngineerInfoById(longR);
		if(cmsEngineerInfo == null) {
			cmsEngineerInfo = new CmsUserEngineerInfo();
			cmsEngineerInfo.setUid(longR);
			us.save(cmsEngineerInfo);
			cmsEngineerInfo = us.findUserEngineerInfoById(longR);
		}
		System.out.println(cmsEngineerInfo.getUid());
		cmsEngineerInfo.setDetail_category("test");
		us.updateUserEngineerInfo(cmsEngineerInfo);
		cmsEngineerInfo = us.findUserEngineerInfoById(longR);
		System.out.println(cmsEngineerInfo.getDetail_category());
		us.deleteUserEngineerInfoById(longR);
		if(us.findUserEngineerInfoById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
