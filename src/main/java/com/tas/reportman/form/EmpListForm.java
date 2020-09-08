package com.tas.reportman.form;

public class EmpListForm {
	
	private int id;
	
	private String userName;
	
	private int reportNumber;
	
	private int unreadNumber;
	
	public EmpListForm() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getReportNumber() {
		return reportNumber;
	}

	public void setReportNumber(int reportNumber) {
		this.reportNumber = reportNumber;
	}

	public int getUnreadNumber() {
		return unreadNumber;
	}

	public void setUnreadNumber(int unreadNumber) {
		this.unreadNumber = unreadNumber;
	}

	@Override
	public String toString() {
		return "EmpListForm [id=" + id + ", userName=" + userName + ", reportNumber=" + reportNumber + ", unreadNumber="
				+ unreadNumber + "]";
	}




	
}
