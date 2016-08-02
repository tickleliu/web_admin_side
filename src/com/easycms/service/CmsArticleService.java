package com.easycms.service;

import com.easycms.base.BaseDao;
import com.easycms.entity.CmsArticle;

public interface CmsArticleService extends BaseDao<CmsArticle, Long>{
	public void saveArticle(CmsArticle article);
	public CmsArticle findArticleById(long id);

}
