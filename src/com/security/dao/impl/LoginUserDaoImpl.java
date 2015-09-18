package com.security.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import com.entity.Users;
import com.security.dao.LoginUserDao;
import com.utils.DBConn;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class LoginUserDaoImpl implements LoginUserDao{

	@Override
	public boolean checkUser(Users user) {
		// TODO Auto-generated method stub
		if(user.username.equals("")||user.username!=null){  
		 ResultSet rs = null;
		 DBConn db=new DBConn(); 
	     rs=db.doSelect("select * from TB_USERINFO where USERNAME='"+user.getUsername()+"'");
	     try {  
             if(rs.next()){         
                     return true;                        
             }  
         } catch (SQLException e) {  
             e.printStackTrace();  
         }  
		}
		return false;
	}

	@Override
	public boolean regNewUser(Users user) {
		// TODO Auto-generated method stub
	/*	
		int max=20000;
	     int min=1;
	     Random random = new Random();

	     int s = random.nextInt(max)%(max-min+1) + min;*/
		 ResultSet rs = null;
		 DBConn db=new DBConn(); 
	     rs=db.doSelect("select * from TB_USERINFO where USERNAME='"+user.getUsername()+"'");
	     try {  
            if(!(rs.next())){  
           	 //db.doInsert("insert into TB_USERINFO(USERID,ROLEID,USERNAME,USERPWD) values ('"+user.getUsername()+s+"',2,'"+user.getUsername()+"','"+user.getPassword()+"')");
            	db.doInsert("insert into TB_USERINFO(USERNAME,USERPWD,ROLEID) values ('"+user.getUsername()+"','"+user.getPassword()+"','2')");
            	
            	return true;
            }
        }catch (SQLException e) {  
	                e.printStackTrace();
	     //if(user.username.equals("")||user.username!=null){
		 //DBConn db = new DBConn();
		 
	     }
		return false;
	}

	@Override
	public boolean loginUser(Users user) {
		// TODO Auto-generated method stub
		
		if(user.username.equals("")||user.username!=null){  
            ResultSet rs=null;  
            DBConn db=new DBConn();  
            rs=db.doSelect("select * from TB_USERINFO where USERNAME='"+user.getUsername()+"' and USERPWD='"+user.getPassword()+"'");  
            try {  
                if(rs.next()){  
                	 if(user.password.equals("")||user.password!=null){  
                       // rs=db.doSelect("select * from TB_USERINFO where USERPWD='"+user.getPassword() +"'");  
                        
                        return true;  
                        
                    }  

                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
		
		
		return false;
	}

	


}
