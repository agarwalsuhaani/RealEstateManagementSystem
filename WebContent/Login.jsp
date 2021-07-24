<%@page import="com.mit.realstate.Role"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
form {
  border: 3px solid #f1f1f1;
}

/* Full-width inputs */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}




/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%@page import="java.sql.*" import="java.io.IOException"%>

<section class="my-5">
	<div class="py-5">
		<h2 class="text-center">Login</h2>
	</div>

<form action="Login.jsp" method="post">
  <div class="container">
    <label for="uname"><b>UserName</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    <button type="submit">Login</button>
     <a href="ChooseUserType.jsp">Register here</a>
       
  </div>

</form>
</section>
<%
Connection con;
Statement stmt;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
	
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("psw");
	stmt = con.createStatement();
	String sql = "Select pwd,role from Login where uname='" + uname + "'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next())
	{
		String temp = rs.getString(1);
		if(pwd.equals(temp))
		{
			out.println("Login Successful!");
			Role role = Role.valueOf(rs.getString(2));
			session.setAttribute("loggedInUser",uname);
			session.setAttribute("Role",role);
			if(Role.client.equals(role)){
				response.sendRedirect("Explore.jsp");
			}
			else if(Role.owner.equals(role))
			{
				response.sendRedirect("AddProperty.jsp");
			}
			else if(Role.agent.equals(role))
			{
				response.sendRedirect("AgentDashboard.jsp");
			}
		}
		else
			out.println("Incorrect Password!<br> Login Failed!");
	}
	else
	{
		out.println("Username doesn't exist");
	}
	
	rs.close();
	stmt.close();
	con.close();
}
catch(Exception e){
	System.out.println(e);	
}

%>
<%@include file="footer.jsp" %>
</body>
</html>