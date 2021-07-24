<%@page import="com.mit.realstate.Role"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page trimDirectiveWhitespaces="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Magic Cement</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="about.jsp">About</a>
      </li>
      <% 
      if(Role.owner.equals(session.getAttribute("Role")))
      {%>
    	  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="AddProperty.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Sell
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AddProperty.jsp">Post your Property</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="Agent.jsp">Find an Agent</a>
        </div>
      </li>
      <%}
      else if(Role.client.equals(session.getAttribute("Role")))
      {%>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="Explore.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Buy
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Explore.jsp">Find a Property</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="Agent.jsp ">Find an Agent</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ClientDashboard.jsp">Dashboard</a>
      </li>
     <%}
      %>
      <li class="nav-item">
        <a class="nav-link" href="contact.jsp">Contact</a>
      </li>
      <%
      if(session.getAttribute("loggedInUser")==null)
      {%>
    	<li class="nav-item">
      <a class="nav-link" href="Login.jsp">Login</a>
    </li>
      <%}
      else{%>
    	  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <%=session.getAttribute("loggedInUser") %>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Logout.jsp">Logout</a>
          
        </div>
      </li>
      <%}
      %>
    </ul>
  </div>
</nav>
</body>
</html>