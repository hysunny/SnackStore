package com.security.service.impl;

import org.springframework.stereotype.Service;

import com.entity.Users;
import com.security.dao.LoginUserDao;
import com.security.dao.impl.LoginUserDaoImpl;
import com.security.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	
	LoginUserDao loginUserDao;

	@Override
	public boolean checkUser(Users user) {
		// TODO Auto-generated method stub
		loginUserDao = new LoginUserDaoImpl();
		boolean bool = loginUserDao.checkUser(user);
		if(bool){
			return true;
		}
		return false;
	}

	@Override
	public boolean regNewUser(Users user) {
		// TODO Auto-generated method stub
		loginUserDao = new LoginUserDaoImpl();
		boolean bool = loginUserDao.regNewUser(user);
		if(bool){
			return true;
		}
		
		return false;
	}

	@Override
	public boolean loginUser(Users user) {
		// TODO Auto-generated method stub
		
		loginUserDao = new LoginUserDaoImpl();
		boolean bool = loginUserDao.loginUser(user);
		if(bool){
			return true;
		}
		return false;
	}

}
