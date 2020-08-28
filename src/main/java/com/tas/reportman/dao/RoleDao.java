package com.tas.reportman.dao;

import com.tas.reportman.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);

}
