package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserLoginInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserLoginInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserLoginInfoTest {
	@Resource(name = "cmsUserLoginInfoServiceImpl")
	private CmsUserLoginInfoServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserLoginInfo cmsLoginInfo= us.findUserLoginInfoById(longR);
		if(cmsLoginInfo == null) {
			cmsLoginInfo = new CmsUserLoginInfo();
			cmsLoginInfo.setUid(longR);
			us.save(cmsLoginInfo);
			cmsLoginInfo = us.findUserLoginInfoById(longR);
		}
		System.out.println(cmsLoginInfo.getUid());
		cmsLoginInfo.setUsername("test");
		us.updateUserLoginInfo(cmsLoginInfo);
		cmsLoginInfo = us.findUserLoginInfoById(longR);
		System.out.println(cmsLoginInfo.getUsername());
		us.deleteUserLoginInfoById(longR);
		if(us.findUserLoginInfoById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
