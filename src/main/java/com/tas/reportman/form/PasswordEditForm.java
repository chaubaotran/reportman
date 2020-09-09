package com.tas.reportman.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.tas.reportman.validation.FieldMatch;

@FieldMatch.List({
    @FieldMatch(first = "newPassword", second = "matchingPassword", message = "(The password fields must match)")
})
public class PasswordEditForm {
	
	private int id;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String currentPassword;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String newPassword;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String matchingPassword;
	
	public PasswordEditForm() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getMatchingPassword() {
		return matchingPassword;
	}

	public void setMatchingPassword(String matchingPassword) {
		this.matchingPassword = matchingPassword;
	}

	@Override
	public String toString() {
		return "PasswordEditForm [id=" + id + ", currentPassword=" + currentPassword + ", newPassword=" + newPassword
				+ ", matchingPassword=" + matchingPassword + "]";
	}
	
	
}
