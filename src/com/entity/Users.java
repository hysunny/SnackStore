package com.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Users {

	public String username;
	public String password;
	public Date birthday;
	
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String toString() {
		
		String str = new SimpleDateFormat("yyyy-MM-dd").format(this.getBirthday());
		return "[username: " + this.getUsername() + ", password: " + this.getPassword() + "]";
		//return "�û�����" + this.getUsername() + ",���룺" + this.getPassword()+",�������ڣ�"+str;
		//return "�û�����" + this.getUsername() + ",���룺" + this.getPassword();
	}
}
