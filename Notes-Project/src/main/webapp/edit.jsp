<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.User.Post" %>

<%
    Post post = (Post) request.getAttribute("post");

    // Prevent null pointer errors
    if (post == null) {
%>
        <html>
        <head>
            <%@include file="all_components/allcss.jsp" %>
            <style>
                .error-container {
                    margin-top: 80px;
                    text-align: center;
                }
            </style>
        </head>
        <body>
            <%@include file="all_components/navbar.jsp" %>
            <div class="container error-container">
                <h3 class="text-danger">⚠️ Error: Post data not found.</h3>
                <a href="home.jsp" class="btn btn-secondary mt-2">Back to Home</a>
            </div>
        </body>
        </html>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Post</title>
    <%@include file="all_components/allcss.jsp" %>
    <style>
        body {
            background-color: #f9f9f9;
        }

        .container {
            max-width: 700px;
            margin-top: 60px;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 25px;
            font-weight: 600;
            text-align: center;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            padding: 8px 25px;
        }

        .btn-secondary {
            padding: 8px 25px;
        }

        .form-control {
            border-radius: 8px;
        }
    </style>
</head>
<body>

    <%@include file="all_components/navbar.jsp" %>

    <div class="container">
        <h2><i class="fa-solid fa-pen-to-square"></i> Edit Post</h2>

        <form action="update" method="post">
            <!-- Hidden ID -->
            <input type="hidden" name="id" value="<%= post.getId() %>">

            <!-- Title -->
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input 
                    type="text" 
                    name="title" 
                    id="title" 
                    class="form-control" 
                    value="<%= post.getTitle() != null ? post.getTitle() : "" %>" 
                    required>
            </div>

            <!-- Content -->
            <div class="mb-3">
                <label for="content" class="form-label">Content</label>
                <textarea 
                    name="content" 
                    id="content" 
                    class="form-control" 
                    rows="5" 
                    required><%= post.getContent() != null ? post.getContent() : "" %></textarea>
            </div>

            <!-- Buttons -->
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="home.jsp" class="btn btn-secondary ms-2">Cancel</a>
        </form>
    </div>

</body>
</html>
