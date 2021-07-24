<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%@include file="navbar.jsp" %>
<%@page import="java.sql.*" import="java.io.IOException"%>
<%
String img_path;
Connection conn=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
	Statement st = conn.createStatement();
	String agent_name = (String)session.getAttribute("loggedInUser");
	String sql= "Select * from appointment where agent_name ='" + agent_name +"'";
	ResultSet rs = st.executeQuery(sql);
	System.out.println("here");
	%>
	<div class="container">
  <h2>Appointment</h2>
         
  <table class="table table-striped">
  <thead>
      <tr>
        <th>Date and Time</th>
        <th>Property Details</th>
        <th>Client Name</th>
        <th>Owner Name</th>
        
      </tr>
    </thead>
    <tbody><% 
	while(rs.next())
	{
		%>
      <tr>
        <td><%=rs.getString(2) %></td>
        <td><a href="Display.jsp?pid=<%=rs.getInt(3) %>">Property</a></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
      </tr>
    	
	<%
	}
   %>
    </tbody>
    </table>
  </div>
  <% 
	System.out.println("here");

}
catch(Exception e)
{
	
}
%>

<%@include file="footer.jsp" %>
</body>
</html>