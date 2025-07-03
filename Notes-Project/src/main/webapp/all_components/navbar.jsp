<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
  <a class="navbar-brand d-flex align-items-center" href="#">
    <i class="fa-solid fa-book me-2"></i> Notes_web
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
          <i class="fa-solid fa-house-user"></i> Home <span class="sr-only">(current)</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addNotes.jsp">
          <i class="fa-solid fa-notes-medical"></i> Add Notes
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showNotes.jsp">
          <i class="fa-solid fa-address-book"></i> Show Notes
        </a>
      </li>
    </ul>

    <%
       UserDetails user = (UserDetails) session.getAttribute("userD");
       if(user != null) {
    %>
    <!-- User dropdown -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle btn btn-light text-dark d-flex align-items-center" href="#" id="userDropdown" role="button" 
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-radius: 25px;">
         <i class="fa-solid fa-user"></i>&nbsp;<%= user.getName() %>
         
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown" style="min-width: 250px;">
          <div class="px-3 py-2 text-center">
            <i class="fa fa-user fa-3x mb-2 text-primary"></i>
            <table class="table table-sm mb-2 text-start">
              <tbody>
                <tr>
                  <th>User ID:</th>
                  <td><%= user.getId() %></td>
                </tr>
                <tr>
                  <th>Full Name:</th>
                  <td><%= user.getName() %></td>
                </tr>
                <tr>
                  <th>Email:</th>
                  <td><%= user.getEmail() %></td>
                </tr>
              </tbody>
            </table>
            <a href="LogoutServlet" class="btn btn-danger btn-sm btn-block">Logout <i class="fa-solid fa-sign-out-alt"></i></a>
          </div>
        </div>
      </li>
    </ul>
    <%
       } else {
    %>
    <div class="d-flex">
      <a href="register.jsp" class="btn btn-outline-light mr-2" type="button">
        <i class="fa-solid fa-registered"></i> Register
      </a>
      <a href="login.jsp" class="btn btn-outline-light" type="button">
        <i class="fa-solid fa-user"></i> Login
      </a>
    </div>
    <%
       }
    %>
  </div>
</nav>
