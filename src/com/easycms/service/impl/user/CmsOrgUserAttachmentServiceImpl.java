package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsOrgUserAttachment;
import com.easycms.service.user.CmsOrgUserAttachmentService;

@Service
public class CmsOrgUserAttachmentServiceImpl extends AbstractBaseDao<CmsOrgUserAttachment, Long> implements
		CmsOrgUserAttachmentService {


	@Override
	public void saveOrgUserAttachment(CmsOrgUserAttachment orgUserAttachment) {
		// TODO Auto-generated method stub
		save(orgUserAttachment);

	}

	@Override
	public CmsOrgUserAttachment findOrgUserAttachmentById(long id) {
		// TODO Auto-generated method stub
		CmsOrgUserAttachment cOrgUserAttachment = findById(id);
		return cOrgUserAttachment;
	}

	@Override
	public void updateOrgUserAttachment(CmsOrgUserAttachment orgUserAttachment) {
		// TODO Auto-generated method stub
		update(orgUserAttachment);
	}

	@Override
	public Pager<CmsOrgUserAttachment> findOrgUserAttachmentsByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteOrgUserAttachmentById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}
