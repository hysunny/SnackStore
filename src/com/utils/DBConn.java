package com.utils;

import java.io.*;
import java.sql.*;

public class DBConn {
	public static String driver;   //定义驱动
	public static String url;
	public static String user;
	public static String password;
	public static Connection conn;
	public static Statement stmt;
	public ResultSet rs;
	
	static{
		try{
			driver="oracle.jdbc.OracleDriver";
			url="jdbc:oracle:thin:@10.72.6.218:1521:ORA10G";
			user="webpt";
			password="webpt";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("-----连接成功------");
		}catch(ClassNotFoundException classnotfoundexception) {     
            classnotfoundexception.printStackTrace();     
          System.err.println("db: " + classnotfoundexception.getMessage());     
      } catch(SQLException sqlexception) {     
          System.err.println("db.getconn(): " + sqlexception.getMessage());     
      }     
	}
	
	public DBConn(){
		this.conn = this.getConn();
	}
	
	public Connection getConn(){
		return this.conn;
	}
	
	public void doInsert(String sql){
		try{
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
		}catch(SQLException sqlexception) {     
            System.err.println("db.executeInset:" + sqlexception.getMessage());     
        }finally{     
                 
        }   
	}
	
	
	public void doDelete(String sql){
		try {
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
		}catch(SQLException sqlexception) {     
            System.err.println("db.executeDelete:" + sqlexception.getMessage());     
        }  
	}
	
	public void doUpdate(String sql){
		try{
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
		}catch(SQLException sqlexception) {     
            System.err.println("db.executeUpdate:" + sqlexception.getMessage());     
        }   
	}
	
	public ResultSet doSelect(String sql){
		try{
			conn = DriverManager.getConnection(url,user,password);
			//结果集的游标可以上下移动，当数据库变化时，当前结果集不变,不能用结果集更新数据库中的表
			stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
			System.out.println("取得结果集");
		}catch(SQLException sqlexception) {     
            System.err.println("db.executeQuery: " + sqlexception.getMessage());     
        }  
		return rs;
	}
	
	public void close(ResultSet rs) throws SQLException,Exception{
		if(rs != null){
			rs.close();
			rs = null;
		}
		if(stmt != null){
			stmt.close();
			stmt = null;
		}
		if(conn != null){
			conn.close();
			conn = null; 
		}
	}

	public void close() throws SQLException,Exception{
		if(stmt != null){
			stmt.close();
			stmt = null;
		}
		if(conn != null){
			conn.close();
			conn = null;
		}
	}
	
	//测试类     
	/*public static void main(String[] args){ 
      DBConn db=new DBConn();  
      db.getConn();  
     ResultSet rs=db.doSelect("select * from db_user where userName='admin'");  
     try {  
        while(rs.next()){  
             System.out.println(rs.getInt(1));  
             System.out.println(rs.getString(3));  
               
         }  
     } catch (SQLException e) {  
         // TODO Auto-generated catch block  
         e.printStackTrace();  
     }  
  }  */
}
