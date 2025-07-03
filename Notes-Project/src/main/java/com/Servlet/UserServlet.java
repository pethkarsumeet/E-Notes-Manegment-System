package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.UserDAO;
import com.Db.DBconnect;
import com.User.UserDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserServlet")
public class UserServlet  extends HttpServlet{

	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name=req.getParameter("fname");
		String email=req.getParameter("uemail");
		String password=req.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		
		UserDAO dao=new UserDAO(DBconnect.getConn());
		boolean f= dao.addUser(us);
		HttpSession session;
		
		if(f)
		{
					
		 session=req.getSession();
			session.setAttribute("reg-sucess","Registration Sucessfully...");
		   resp.sendRedirect("register.jsp");
		}
		else {
			
			session=req.getSession();
			session.setAttribute( "failed-msg","Something Went Wrong");
			resp.sendRedirect("register.jsp");
		}
		   
		
	}
	
	
}
