package com.security.controller;
import com.security.dao.LoginUserDao;
import com.security.dao.impl.LoginUserDaoImpl;
import com.security.service.LoginService;
import com.security.service.impl.LoginServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Users;

@Controller
public class RegLoginController {
	

	@RequestMapping(value="regUsers",method=RequestMethod.GET)
	public String regUsersView()
	{
		return "reg_users";
	}
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String loginView()
	{
		return "login";
	}
	
	@RequestMapping(value="check",method=RequestMethod.GET)
	public String checkView()
	{
		return "true";
	}

	
	@RequestMapping(value="regUsers",method=RequestMethod.POST)
	public ModelAndView regUsersModel(HttpServletRequest request,HttpServletResponse response,HttpSession session,Users u)
	{

		LoginService loginService = new LoginServiceImpl();

          boolean bool=loginService.regNewUser(u);
        session.setAttribute("login_user", u);

		if(bool){			
			return new ModelAndView("reg_users_success");
		}
		//session.setAttribute("password", passwd);
		return new ModelAndView("login_error");
		

	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public ModelAndView loginModel(Users u,HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{

		LoginService loginService = new LoginServiceImpl();

        boolean bool=loginService.loginUser(u);

		if(bool){			
			return new ModelAndView("/../../index");
		}
		session.setAttribute("userSession", u.getUsername());
		return new ModelAndView("login_error");
	
	}
	
	@RequestMapping(value="check",method=RequestMethod.POST)
	@ResponseBody	
	public String checkUserAjax(Users u,HttpServletRequest request, HttpServletResponse response) throws Exception{

		LoginService loginService = new LoginServiceImpl();
		//System.out.println(u.getUsername());
		 boolean bool=loginService.checkUser(u);
	        //System.out.println(bool);
	        if(bool){			
				return "true";
			}	       
	        
	   return "false";
}

	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder)
	{
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
}
