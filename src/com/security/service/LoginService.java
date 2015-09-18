package com.security.service;

import com.entity.Users;

public interface LoginService {
	//public boolean checkUser(Users user);
	public boolean checkUser(Users user);
	public boolean regNewUser(Users user);
	public boolean loginUser(Users user);

}
