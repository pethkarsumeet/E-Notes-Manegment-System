package com.Servlet;

import com.DAO.postDAO;
import com.Db.DBconnect;
import com.User.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/edit")
public class EditNoteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // ✅ Fixes the warning

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	int noteid = Integer.parseInt(request.getParameter("note_id"));
    	postDAO dao = new postDAO(DBconnect.getConn());
    	Post post = dao.getPostById(noteid);

    	request.setAttribute("post", post);
    	request.getRequestDispatcher("edit.jsp").forward(request, response);

    }
}
