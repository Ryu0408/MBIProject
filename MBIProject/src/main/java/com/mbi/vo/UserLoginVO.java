package com.mbi.vo;

// 커맨드 객체
public class UserLoginVO {
	
	private int loginSid;
	private String userid;
	private String userpw;
	private String username;
	private String userjuminA;
	private String userjuminB;
	
	public int getLoginSid() {
		return loginSid;
	}
	public void setLoginSid(int loginSid) {
		this.loginSid = loginSid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserjuminA() {
		return userjuminA;
	}
	public void setUserjuminA(String userjuminA) {
		this.userjuminA = userjuminA;
	}
	public String getUserjuminB() {
		return userjuminB;
	}
	public void setUserjuminB(String userjuminB) {
		this.userjuminB = userjuminB;
	}
	
}

class Agreement {
	private int agreement1;
	private int agreement2;
	private int agreement3;
	
	public int getAgreement1() {
		return agreement1;
	}
	public void setAgreement1(int agreement1) {
		this.agreement1 = agreement1;
	}
	public int getAgreement2() {
		return agreement2;
	}
	public void setAgreement2(int agreement2) {
		this.agreement2 = agreement2;
	}
	public int getAgreement3() {
		return agreement3;
	}
	public void setAgreement3(int agreement3) {
		this.agreement3 = agreement3;
	}
}
