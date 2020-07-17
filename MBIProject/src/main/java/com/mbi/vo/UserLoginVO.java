package com.mbi.vo;

import java.util.Date;

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
