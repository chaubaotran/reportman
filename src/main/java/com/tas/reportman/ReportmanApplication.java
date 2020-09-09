package com.tas.reportman;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.tas.reportman.entity.Role;
import com.tas.reportman.service.RoleService;
import com.tas.reportman.service.UserService;
import com.tas.reportman.user.CrmUser;

@SpringBootApplication
public class ReportmanApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReportmanApplication.class, args);
	}
	
	@Bean
	CommandLineRunner  applicationRunner(RoleService roleService, UserService userService) {
		return args -> {
			if (roleService.findRoleByName("ROLE_EMPLOYEE") == null) {
				roleService.saveOrUpdateRole(new Role("ROLE_EMPLOYEE"));
			}
			if (roleService.findRoleByName("ROLE_MANAGER") == null) {
				roleService.saveOrUpdateRole(new Role("ROLE_MANAGER"));
			}
			if (roleService.findRoleByName("ROLE_ADMIN") == null) {
				roleService.saveOrUpdateRole(new Role("ROLE_ADMIN"));
			}
			
			if (userService.findByUserId(1) == null) { 
				List<String> roles = new ArrayList<>();
				roles.add("ADMIN");
				userService.save(new CrmUser("admin", "admin", "admin", "admin", "admin", "admin@tas.com", roles));				
			}
		};
	}
		

}
