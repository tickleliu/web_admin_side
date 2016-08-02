package com.easycms.service.impl;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.entity.CmsArticle;
import com.easycms.service.CmsArticleService;

@Service
public class CmsArticleServiceImpl extends AbstractBaseDao<CmsArticle, Long> implements
		CmsArticleService {


	@Override
	public void saveArticle(CmsArticle article) {
		// TODO Auto-generated method stub
		save(article);

	}

	@Override
	public CmsArticle findArticleById(long id) {
		// TODO Auto-generated method stub
		CmsArticle cArticle = findById(id);
		return cArticle;
	}

}
