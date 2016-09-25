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

		Long longR = 123L;
		CmsOrgUser cmsOrgUser= null;
		if(cmsOrgUser == null) {
			cmsOrgUser = new CmsOrgUser();
			cmsOrgUser.setUid(longR);
			cmsOrgUser.setAddress("北京市丰台区");
			cmsOrgUser.setContact_name("王大力");
			cmsOrgUser.setContact_position("经理");
			cmsOrgUser.setEmail("wangdali@qq.com");
			cmsOrgUser.setEnterprise_name("信息技术有限公司");
			cmsOrgUser.setPhone("88108081");
			cmsOrgUser.setZip_code("100010");
			cmsOrgUser.setLicense_number("23090310031022");
			us.save(cmsOrgUser);
			cmsOrgUser = us.findOrgUserById(longR);
		}
		System.out.println(cmsOrgUser.getUid());
		cmsOrgUser.setAddress("test");
		us.updateOrgUser(cmsOrgUser);
		cmsOrgUser = us.findOrgUserById(longR);
		System.out.println(cmsOrgUser.getAddress());
//		us.deleteOrgUserById(longR);
//		if(us.findOrgUserById(longR) == null) {
//			System.out.println("delete: success");
//		} else {
//			System.out.println("delete: failed");
//		}
	}
}
