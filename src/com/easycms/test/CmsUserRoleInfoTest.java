package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserLoginInfo;
import com.easycms.entity.user.CmsUserRoleInfo;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserLoginInfoServiceImpl;
import com.easycms.service.impl.user.CmsUserRoleServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:/applicationContext-mybatis.xml",
		"classpath:/applicationContext-common.xml" })
public class CmsUserRoleInfoTest {
	@Resource(name = "cmsUserRoleServiceImpl")
	private CmsUserRoleServiceImpl us;

	@Test
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserRoleInfo cmsRoleInfo = us.findUserRoleById(longR);
		if (cmsRoleInfo == null) {
			cmsRoleInfo = new CmsUserRoleInfo();
			cmsRoleInfo.setUid(longR);
			us.save(cmsRoleInfo);
			cmsRoleInfo = us.findUserRoleById(longR);
		}
		System.out.println(cmsRoleInfo.getUid());
		cmsRoleInfo.setIsadmin(1);
		us.updateUserRole(cmsRoleInfo);
		cmsRoleInfo = us.findUserRoleById(longR);
		System.out.println(cmsRoleInfo.getIsadmin());
//		us.deleteUserRoleById(longR);
		if (us.findUserRoleById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
