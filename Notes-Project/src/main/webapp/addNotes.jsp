<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
     <%
    
       UserDetails user1=(UserDetails)session.getAttribute("userD");
       if(user1==null)
       {
    	   response.sendRedirect("login.jsp");
    	   session.setAttribute("Login-error","Please login your account");
       }
    %>
    
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_components/allcss.jsp" %>
<title>Add Notes</title>
</head>
<body>
<div class="container-fluid">
<%@include file="all_components/navbar.jsp" %>
<h1 class="text-center mt-4">Add Your Notes</h1>
  
<div class="container mt-5">
  <div class="card shadow">
    <div class="card-header bg-custom text-white">
      <h4 class="mb-0">Add New Note</h4>
    </div>
    <div class="card-body">
      <form action="AddNotesServlet" method="post">

        <!-- Title Field -->
        <div class="form-group">
        
         <% 
         
          UserDetails us=(UserDetails)session.getAttribute("userD");
         if(us!=null)
         {%>
        	  <input type="hidden" name="uid" value="<%= us.getId() %>">
        	   
       
         <% }
         %>
        
          <label for="title"> Enter  Title</label>
          <input type="text" name="title" id="title" class="form-control" placeholder="Enter title" required>
        </div>

        <!-- Content Field -->
        <div class="form-group">
          <label for="content">Enter your Content</label>
          <textarea name="content" id="content" rows="5" class="form-control" placeholder="Enter your notes" required></textarea>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn  bg-custom  btn-block text-white">Save Note</button>

      </form>
    </div>
  </div>
</div>

 
</body>
</html>