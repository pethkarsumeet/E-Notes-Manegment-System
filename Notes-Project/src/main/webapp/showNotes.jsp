<%@page import="java.util.*"%>
<%@page import="com.User.Post"%>
<%@page import="com.Db.DBconnect"%>
<%@page import="com.DAO.postDAO"%>
<%@page import="com.User.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    UserDetails user3 = (UserDetails) session.getAttribute("userD");
    if (user3 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error", "Please login your account");
        return;
    }

    int uid = Integer.parseInt(user3.getId());
    postDAO ob = new postDAO(DBconnect.getConn());

    String query = request.getParameter("search");
    String currentPageStr = request.getParameter("page");
    int currentPage = (currentPageStr == null || currentPageStr.equals("")) ? 1 : Integer.parseInt(currentPageStr);
    int pageSize = 3;

    List<Post> allPosts = ob.getData(uid);

    List<Post> filteredPosts = new ArrayList<>();
    if (query != null && !query.trim().isEmpty()) {
        for (Post p : allPosts) {
            if (p.getTitle().toLowerCase().contains(query.toLowerCase()) ||
                p.getContent().toLowerCase().contains(query.toLowerCase())) {
                filteredPosts.add(p);
            }
        }
    } else {
        filteredPosts = allPosts;
    }

    int totalPosts = filteredPosts.size();
    int start = (currentPage - 1) * pageSize;
    int end = Math.min(start + pageSize, totalPosts);
    List<Post> paginatedPosts = filteredPosts.subList(start, end);

    int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Notes Page</title>
    <%@include file="all_components/allcss.jsp" %>
    <style>
        .search-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .table th, .table td {
            vertical-align: middle !important;
        }

        .img-thumb {
            width: 80px;
            height: auto;
        }

        .pagination-right {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<div class="container">
    <h2 class="text-center mt-3 mb-4"> <i class="fa-solid fa-book"></i>  All Notes</h2>

    <!-- Search Bar (Right-aligned) -->
    <div class="search-bar">
        <form method="get" class="form-inline">
            <input type="text" name="search" class="form-control mr-2" placeholder="Search notes..." value="<%= (query != null) ? query : "" %>">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>

    <!-- Notes Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Published By</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int serial = start + 1;
                    for (Post po : paginatedPosts) {
                %>
                <tr>
                    <td><%= serial++ %></td>
                    <td><img src="image/not3.jpg" alt="Note Image" class="img-thumb"></td>
                    <td><%= po.getTitle() %></td>
                    <td><%= po.getContent() %></td>
                    <td><%= user3.getName() %></td>
                    <td>
                       
                        <a href="edit?note_id=<%= po.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                        <a href="delete.jsp?note_id=<%= po.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                        
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Pagination Bottom Right -->
    <div class="pagination-right">
        <nav>
            <ul class="pagination">
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="?page=<%= i %><%=(query != null ? "&search=" + query : "")%>"><%= i %></a>
                    </li>
                <% } %>
            </ul>
        </nav>
    </div>
</div>

</body>
</html>
