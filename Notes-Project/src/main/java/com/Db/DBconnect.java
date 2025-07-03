package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	public static Connection getConn(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notes","root","Pass");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	} 
	
	
	
//	private static Connection con;
//	public static Connection getConn()
//	{
//		
//		try {
//			
//			if(con==null) {
//				 Class.forName("com.mysql.cj.jdbc.Driver");
//				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","Pass");  
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		return con;
//	}
	
}
