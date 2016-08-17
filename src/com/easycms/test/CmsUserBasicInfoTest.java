package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserBasicInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserBasicInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserBasicInfoTest {
	@Resource(name = "cmsUserBasicInfoServiceImpl")
	private CmsUserBasicInfoServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserBasicInfo cmsBasicInfo= us.findUserBasicInfoById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserBasicInfo();
			cmsBasicInfo.setUid(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserBasicInfoById(longR);
		}
		System.out.println(cmsBasicInfo.getUid());
		cmsBasicInfo.setAddress("test");
		us.updateUserBasicInfo(cmsBasicInfo);
		cmsBasicInfo = us.findUserBasicInfoById(longR);
		System.out.println(cmsBasicInfo.getAddress());
		us.deleteUserBasicInfoById(longR);
		if(us.findUserBasicInfoById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
