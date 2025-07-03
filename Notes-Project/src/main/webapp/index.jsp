<%@page import="com.Db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style type="text/css">

.back-img {
    background: url("image/not.jpg");
    width: 100%;
    height: 100vh;
    background-size: cover;
    background-position: center;
}

</style>

<%@include file="all_components/allcss.jsp" %>
</head>
<body>

 <%@include file="all_components/navbar.jsp" %>
 


 
 
 <div class="container-fluid back-img">
    <div class="text-center">
    <h1 class="text-white">   <i class="fa-solid fa-book"></i>      Notes-Save Your Notes</h1>
    <a href="login.jsp" class="btn btn-light"> <i class="fa-solid fa-right-to-bracket"></i>  Login</a>
    <a href="register.jsp" class="btn btn-light"> <i class="fa-solid fa-registered"></i>   Register</a>
    </div>
 
 </div>

</body>
</html>