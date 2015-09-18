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
		//return "用户名：" + this.getUsername() + ",密码：" + this.getPassword()+",出生日期："+str;
		//return "用户名：" + this.getUsername() + ",密码：" + this.getPassword();
	}
}
