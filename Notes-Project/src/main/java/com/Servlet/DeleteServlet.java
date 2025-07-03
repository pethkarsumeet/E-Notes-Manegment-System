package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.postDAO;
import com.Db.DBconnect;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        postDAO dao = new postDAO(DBconnect.getConn());
        boolean success = dao.deletePostById(id);

        if (success) {
            response.sendRedirect("showNotes.jsp?msg=deleted");
        } else {
            response.sendRedirect("home.jsp?msg=error");
        }
    }
}

