package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.entity.user.CmsUserEngineerCertificate;
import com.easycms.service.CmsArticleService;
import com.easycms.service.impl.user.CmsUserEngineerCertificateServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsUserEngineerCertificateTest {
	@Resource(name = "cmsUserEngineerCertificateServiceImpl")
	private CmsUserEngineerCertificateServiceImpl us;
	
	@Test 
	public void test() {
		Random random = new Random(System.currentTimeMillis());
		Long longR = random.nextLong();
		CmsUserEngineerCertificate cmsBasicInfo= us.findUserEngineerCertificateById(longR);
		if(cmsBasicInfo == null) {
			cmsBasicInfo = new CmsUserEngineerCertificate();
			cmsBasicInfo.setCert_id(longR);
			us.save(cmsBasicInfo);
			cmsBasicInfo = us.findUserEngineerCertificateById(longR);
		}
		System.out.println(cmsBasicInfo.getCert_id());
		cmsBasicInfo.setCertificate_name("test");
		us.updateUserEngineerCertificate(cmsBasicInfo);
		cmsBasicInfo = us.findUserEngineerCertificateById(longR);
		System.out.println(cmsBasicInfo.getCertificate_name());
		us.deleteUserEngineerCertificateById(longR);
		if(us.findUserEngineerCertificateById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
