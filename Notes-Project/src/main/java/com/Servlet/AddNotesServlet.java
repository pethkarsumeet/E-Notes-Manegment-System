package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.postDAO;
import com.Db.DBconnect;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            int uid = Integer.parseInt(request.getParameter("uid"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            
            postDAO dao = new postDAO(DBconnect.getConn());  

           
            boolean f = dao.AddNotes(title, content, uid);

           
            if (f) {
            	
                System.out.println("Data inserted successfully");
                 response.sendRedirect("showNotes.jsp");
                 
            } else {
                System.out.println("Something went wrong");
                
            }

        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }
}
