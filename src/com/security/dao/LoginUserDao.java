package com.security.dao;

import com.entity.Users;

public interface LoginUserDao {
	public boolean checkUser(Users user);
	public boolean regNewUser(Users user);
	public boolean loginUser(Users user);
	//public boolean checkUser(Users user);

}
