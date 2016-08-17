package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsOrgUser;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsOrgUserServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsOrgUserTest {
	@Resource(name = "cmsOrgUserServiceImpl")
	private CmsOrgUserServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsOrgUser cmsOrgUser= us.findOrgUserById(longR);
		if(cmsOrgUser == null) {
			cmsOrgUser = new CmsOrgUser();
			cmsOrgUser.setUid(longR);
			us.save(cmsOrgUser);
			cmsOrgUser = us.findOrgUserById(longR);
		}
		System.out.println(cmsOrgUser.getUid());
		cmsOrgUser.setAddress("test");
		us.updateOrgUser(cmsOrgUser);
		cmsOrgUser = us.findOrgUserById(longR);
		System.out.println(cmsOrgUser.getAddress());
		us.deleteOrgUserById(longR);
		if(us.findOrgUserById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
