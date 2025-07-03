<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   UserDetails user2 = (UserDetails) session.getAttribute("userD");
   if(user2 == null) {
       session.setAttribute("Login-error", "Please login your account");
       response.sendRedirect("login.jsp");
       return; 
   }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Start Writing Notes</title>
<%@ include file="all_components/allcss.jsp" %>
<style>
  body, html {
    height: 100%;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    flex-direction: column;
  }

  /* Keep navbar as is */
  /* Container limits height to 90vh */
  .main-content {
    height: 90vh;       /* Limit height */
    flex: 1 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px 15px;
  }

  /* Card styling */
  .notes-card {
    background: white;
    border-radius: 16px;
    box-shadow: 0 12px 25px rgba(0,0,0,0.15);
    max-width: 380px;
    width: 100%;
    padding: 30px 25px 40px;
    text-align: center;

    /* allow card content to scroll if needed */
    max-height: 100%;
    overflow-y: auto;
  }

  /* Responsive image */
  .notes-card img {
    max-width: 70%;
    height: auto;
    border-radius: 12px;
    margin-bottom: 25px;
    box-shadow: 0 8px 15px rgba(118, 75, 162, 0.3);
    transition: transform 0.3s ease;
  }
  .notes-card img:hover {
    transform: scale(1.05);
  }

  /* Heading */
  .notes-card h1 {
    font-weight: 700;
    color: #4b3b72;
    margin-bottom: 30px;
    font-size: 1.8rem;
    letter-spacing: 1.2px;
  }

  /* Button */
  .btn-custom {
    background: #764ba2;
    color: white;
    font-weight: 600;
    padding: 12px 30px;
    border-radius: 30px;
    border: none;
    box-shadow: 0 6px 12px rgba(118, 75, 162, 0.4);
    transition: background 0.3s ease, transform 0.2s ease;
    text-transform: uppercase;
    letter-spacing: 1px;
    display: inline-block;
  }
  .btn-custom:hover {
    background: #5a337d;
    color: #f0e9ff;
    transform: translateY(-3px);
  }

  /* Responsive font sizing for small devices */
  @media (max-width: 400px) {
    .notes-card h1 {
      font-size: 1.4rem;
    }
    .btn-custom {
      padding: 10px 25px;
      font-size: 0.9rem;
    }
  }
</style>
</head>
<body>

<%@ include file="all_components/navbar.jsp" %>

<div class="main-content">
  <div class="notes-card">
    <img alt="Notebook Image" src="image/not3.jpg" />
    <h1>Start Writing Your Notes</h1>
    <a href="addNotes.jsp" class="btn btn-custom">Start Here</a>
  </div>
</div>

</body>
</html>
