package com.easycms.service.impl.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.easycms.base.AbstractBaseDao;
import com.easycms.common.Pager;
import com.easycms.entity.user.CmsUserEngineerCertificate;
import com.easycms.service.user.CmsUserEngineerCertificateService;

@Service
public class CmsUserEngineerCertificateServiceImpl extends AbstractBaseDao<CmsUserEngineerCertificate, Long> implements
		CmsUserEngineerCertificateService {


	@Override
	public void saveUserEngineerCertificate(CmsUserEngineerCertificate certificate) {
		// TODO Auto-generated method stub
		save(certificate);

	}

	@Override
	public CmsUserEngineerCertificate findUserEngineerCertificateById(long id) {
		// TODO Auto-generated method stub
		CmsUserEngineerCertificate cUserEngineerCertificate = findById(id);
		return cUserEngineerCertificate;
	}

	@Override
	public void updateUserEngineerCertificate(CmsUserEngineerCertificate certificate) {
		// TODO Auto-generated method stub
		update(certificate);
	}

	@Override
	public Pager<CmsUserEngineerCertificate> findUserEngineerCertificatesByKey(Map<String, Object> map,
			int showPages, int pageSize) {
		// TODO Auto-generated method stub
		map.put("showPages", showPages);
		map.put("pageSize", pageSize);
		return findByKey(map, ".findByKey");
	}

	@Override
	public void deleteUserEngineerCertificateById(long id) {
		// TODO Auto-generated method stub
		delete(id);
	}
}

