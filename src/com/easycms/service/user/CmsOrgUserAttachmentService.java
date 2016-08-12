package com.easycms.service.user;

import java.util.Map;

import com.easycms.base.BaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgUserAttachment;

public interface CmsOrgUserAttachmentService extends BaseDao<CmsOrgUserAttachment, Long>{
	public void saveOrgUserAttachment(CmsOrgUserAttachment orgUserAttachment);
	public CmsOrgUserAttachment findOrgUserAttachmentById(long id);
	public void updateOrgUserAttachment(CmsOrgUserAttachment article);
	public Pager<CmsOrgUserAttachment> findOrgUserAttachmentsByKey(Map<String, Object> map, int showPages, int pageSize);
	public void deleteOrgUserAttachmentById(long id);

}
