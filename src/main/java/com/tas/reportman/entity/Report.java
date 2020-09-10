package com.tas.reportman.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.sun.istack.NotNull;

@Entity
@Table(name = "report")
public class Report {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@NotNull
	@Size(min=1, message="必須項目をご入力ください")
	@Column(name = "task")
	private String task;
	
	@NotNull
	@Size(min=1, message="必須項目をご入力ください")
	@Column(name = "detail")
	private String detail;
	
	@NotNull
	@Size(min=1, message="必須項目をご入力ください")
	@Column(name = "result")
	private String result;
	
	@NotNull
	@Size(min=1, message="必須項目をご入力ください")
	@Column(name = "feeling")
	private String feeling;
	
	@Column(name = "date")
	private String date;
	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id", nullable=false)
    private User user;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="report",
			   cascade= {CascadeType.REFRESH})
	private Set<UserReportReadStatus> userReportReadSatus  = new HashSet<>();

	public Report() {
		
	}

	public Report(String task, String detail, String result, String feeling, String date) {
		this.task = task;
		this.detail = detail;
		this.result = result;
		this.feeling = feeling;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Set<UserReportReadStatus> getUserReportReadSatus() {
		return userReportReadSatus;
	}

	public void setUserReportReadSatus(Set<UserReportReadStatus> userReportReadSatus) {
		this.userReportReadSatus = userReportReadSatus;
	}
	
	public void addUserReportReadSatus(UserReportReadStatus u) {
		this.userReportReadSatus.add(u);
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", task=" + task + ", detail=" + detail + ", result=" + result + ", feeling="
				+ feeling + ", date=" + date + "]";
	}
		
}
