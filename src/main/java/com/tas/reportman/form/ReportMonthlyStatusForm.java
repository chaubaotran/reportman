package com.tas.reportman.form;

public class ReportMonthlyStatusForm {
	private int id;
	private String date;
	private boolean read;
	
	public ReportMonthlyStatusForm() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}	

	public boolean isRead() {
		return read;
	}

	public void setRead(boolean read) {
		this.read = read;
	}

	@Override
	public String toString() {
		return "ReportMonthlyStatusForm [id=" + id + ", date=" + date + ", read=" + read + "]";
	}

	
	
}
