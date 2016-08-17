package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserExperterInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserExperterInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserExperterInfoTest {
	@Resource(name = "cmsUserExperterInfoServiceImpl")
	private CmsUserExperterInfoServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserExperterInfo cmsExperterInfo= us.findUserExperterInfoById(longR);
		if(cmsExperterInfo == null) {
			cmsExperterInfo = new CmsUserExperterInfo();
			cmsExperterInfo.setUid(longR);
			us.save(cmsExperterInfo);
			cmsExperterInfo = us.findUserExperterInfoById(longR);
		}
		System.out.println(cmsExperterInfo.getUid());
		cmsExperterInfo.setCategory("test");
		us.updateUserExperterInfo(cmsExperterInfo);
		cmsExperterInfo = us.findUserExperterInfoById(longR);
		System.out.println(cmsExperterInfo.getCategory());
		us.deleteUserExperterInfoById(longR);
		if(us.findUserExperterInfoById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
