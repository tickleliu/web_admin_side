package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserRewardInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserRewardInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserRewardInfoTest {
	@Resource(name = "cmsUserRewardInfoServiceImpl")
	private CmsUserRewardInfoServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserRewardInfo cmsBasicInfo= us.findUserRewardInfoById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserRewardInfo();
			cmsBasicInfo.setReward_id(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserRewardInfoById(longR);
		}
		System.out.println(cmsBasicInfo.getReward_id());
		cmsBasicInfo.setReward_content("test");
		us.updateUserRewardInfo(cmsBasicInfo);
		cmsBasicInfo = us.findUserRewardInfoById(longR);
		System.out.println(cmsBasicInfo.getReward_content());
		us.deleteUserRewardInfoById(longR);
		if(us.findUserRewardInfoById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
