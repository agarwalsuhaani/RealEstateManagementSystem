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
	String client_name = (String)session.getAttribute("loggedInUser");
	String sql= "Select * from appointment where client_name ='" + client_name +"'";
	ResultSet rs = st.executeQuery(sql);
	%>
	<div class="container">
  <h2>My Cart</h2>
         
  <table class="table table-striped">
  <thead>
      <tr>
        <th>Serial No</th>
        <th>Property Details</th>
        <th>Owner Name</th>
        <th>Agent Name</th>
        <th>Invoice</th>
        
      </tr>
    </thead>
    <tbody><% 
	while(rs.next())
	{ int count=1;
		%>
      <tr>
        <td><%=count%></td>
        <td><a href="Display.jsp?pid=<%=rs.getInt(3) %>">Property</a></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getString(1) %></td>
        <td><a href="invoice.jsp?propertyID=<%=rs.getInt(3)%>">Invoice</a></td>
      </tr>
    	
	<%
	count++;
	}
   %>
    </tbody>
    </table>
  </div>
  <% 
	
}
catch(Exception e)
{
	
}
%>

<%@include file="footer.jsp" %>
</body>
</html>