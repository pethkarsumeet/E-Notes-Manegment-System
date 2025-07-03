<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.User.Post" %>
<%@ page import="com.DAO.postDAO" %>
<%@ page import="com.Db.DBconnect" %>

<%
    String idStr = request.getParameter("note_id");
    int noteId = 0;
    try {
        noteId = Integer.parseInt(idStr);
    } catch (Exception e) {
        response.sendRedirect("home.jsp?msg=invalid");
        return;
    }

    postDAO dao = new postDAO(DBconnect.getConn());
    Post post = dao.getPostById(noteId);

    if (post == null) {
        response.sendRedirect("home.jsp?msg=notfound");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Delete</title>
    <%@ include file="all_components/allcss.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 80px;
            max-width: 600px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h3 {
            color: #dc3545;
        }
    </style>
</head>
<body>

<%@ include file="all_components/navbar.jsp" %>

<div class="container text-center">
    <h3>Are you sure you want to delete this post?</h3>
    <hr>
    <h5>Title: <%= post.getTitle() %></h5>
    <p><%= post.getContent() %></p>

    <form action="delete" method="post">
        <input type="hidden" name="id" value="<%= post.getId() %>">
        <button type="submit" class="btn btn-danger">Yes, Delete</button>
        <a href="home.jsp" class="btn btn-secondary ms-2">Cancel</a>
    </form>
</div>

</body>
</html>
