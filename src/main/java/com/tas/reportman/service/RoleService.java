package com.tas.reportman.service;

import com.tas.reportman.entity.Role;

public interface RoleService {
	
	public Role findRoleByName(String theRoleName);
	
	public void saveOrUpdateRole(Role role);

}
