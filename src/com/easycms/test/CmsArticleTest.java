package com.easycms.test;

import java.util.Random;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easycms.entity.CmsArticle;
import com.easycms.service.CmsArticleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext-mybatis.xml","classpath:/applicationContext-common.xml"})
public class CmsArticleTest {
	@Resource(name = "cmsArticleServiceImpl")
	private CmsArticleService as;
	
	@Test 
	public void test() {
		Random random = new Random();
		Long longR = random.nextLong();
		CmsArticle cmsArticle = as.findArticleById(longR);
		if(cmsArticle == null) {
			cmsArticle = new CmsArticle();
			cmsArticle.setAid(longR);
			as.save(cmsArticle);
			cmsArticle = as.findArticleById(longR);
		}
		System.out.println(cmsArticle.getAid());
		as.deleteArticleById(longR);
		if(as.findArticleById(longR) == null) {
			System.out.println("delete: success");
		} else {
			System.out.println("delete: failed");
		}
	}
}
