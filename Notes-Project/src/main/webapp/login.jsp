<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all_components/allcss.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp"%>


	<div class="container-fluid">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
					 <h4 >Login</h4>
					</div>
					
					 <%
                
                 String invalidMsg=(String)  session.getAttribute("login-faild");
                if(invalidMsg!=null)
                {
                	%>
                	<div class="alert alert-danger" role="alert">
                   <%= invalidMsg %>
                </div>	
                	<%
                	
                	session.removeAttribute("login-faild");
                	
                }
                %>
                
                
                <%
                 String withoutLogin=(String)session.getAttribute("Login-error");
                if(withoutLogin!=null)
                {%>
                    
                     <div class="alert alert-danger" role="alert"><%= withoutLogin%></div>
                
                <%	
                session.removeAttribute("Login-error");
            	
                }
                %>
					
					<%
					  String loMsg=(String)session.getAttribute("logoutMsg");
					if(loMsg!=null)
	                {
	                	%>
	                	<div class="alert alert-success" role="alert">
	                   <%= loMsg %>
	                </div>	
	                	<%
	                	
	                	session.removeAttribute("logoutMsg");
	                	
	                }
					%>
					
					<div class="card-body">
						<form action="loginServlet" method="post">
							<div class="form-group">
							<label>Enter Your Email</label>
							 <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail"> 
							</div>
							<div class="form-group">
							<label for="exampleInputPassword1">Enter Your Password</label>
								 <input
									type="password" class="form-control" id="exampleInputPassword1" name="upassword">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block bg-custom">Login</button>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>

   

</body>
</html>