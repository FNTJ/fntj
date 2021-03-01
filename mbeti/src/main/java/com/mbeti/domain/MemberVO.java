package com.mbeti.domain;

import java.util.Date;

public class MemberVO {
	
	private String mb;
	private String userName;
	private String userID;
	private String userEmail;
	private String userPassword;
	private String userBirthday;
	private Date regdate;
	private String keyword1;
	private String keyword2;
	private String keyword3;
	private String keyword4;
	private String keyword5;
	private int enabled;

	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getMb() {
		return mb;
	}
	public void setMb(String mb) {
		this.mb = mb;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}
	public String getKeyword4() {
		return keyword4;
	}
	public void setKeyword4(String keyword4) {
		this.keyword4 = keyword4;
	}
	public String getKeyword5() {
		return keyword5;
	}
	public void setKeyword5(String keyword5) {
		this.keyword5 = keyword5;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [mb=" + mb + 
				", userName=" + userName +
				", userID=" + userID +
				", userEmail=" + userEmail +
				", userPassword=" + userPassword +
				", userBirthday=" + userBirthday +
				", regdate=" + regdate + 
				", keyword1=" + keyword1 + 
				", keyword2=" + keyword2 + 
				", keyword3=" + keyword3 + 
				", keyword4=" + keyword4 + 
				", keyword5=" + keyword5 + "]";
	}

}
