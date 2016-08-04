package com.easycms.service;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.CmsArticle;

public interface CmsArticleService extends BaseDao<CmsArticle, Long>{
	public void saveArticle(CmsArticle article);
	public CmsArticle findArticleById(long id);
	public void updateArticle(CmsArticle article);
	public Pager<CmsArticle> findArticlesByKey(Map<String, Object> map, int showPages, int pageSize);

}
