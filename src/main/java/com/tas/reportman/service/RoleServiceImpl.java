package com.tas.reportman.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tas.reportman.dao.RoleDao;
import com.tas.reportman.entity.Role;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleDao roleDao;

	@Override
	@Transactional
	public Role findRoleByName(String theRoleName) {
		return roleDao.findRoleByName(theRoleName);
	}

	@Override
	@Transactional
	public void saveOrUpdateRole(Role role) {
		roleDao.saveOrUpdateRole(role);
	}

}
