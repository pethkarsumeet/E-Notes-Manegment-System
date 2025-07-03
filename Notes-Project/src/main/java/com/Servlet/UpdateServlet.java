package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.postDAO;
import com.Db.DBconnect;
import com.User.Post;


@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Post updatedPost = new Post();
            updatedPost.setId(id);
            updatedPost.setTitle(title);
            updatedPost.setContent(content);

            postDAO dao = new postDAO(DBconnect.getConn());
            boolean updated = dao.updatePost(updatedPost);

            if (updated) {
                response.sendRedirect("showNotes.jsp?msg=updated");
            } else {
                response.sendRedirect("home.jsp?msg=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp?msg=error");
        }
    }
}

