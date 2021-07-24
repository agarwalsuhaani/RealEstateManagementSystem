<%@page import="com.mysql.cj.util.DnsSrv.SrvRecord"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Property</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@page import="java.sql.*" import="java.io.IOException"%>
<%
Connection conn=null;
List<String> list = new ArrayList<String>();

try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
	String sql = "Select * from property";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	%><section class="my-5">
	<div class="py-3">
		<h2 class="text-center">Buy</h2>
	</div>
	<div class="container-fluid">
	<div class="row"><%
	while(rs.next())
	{%>
	 
			<div class="col-lg-4 col-md-3 col-12">
				<div class="card" >
					  <img class="card-img-top" src="http://localhost:8080/RealEstate/imageDisplay.jsp?pID=<%=rs.getInt(1)%>" alt="Card image" class="img-fluid cardimg">
					  <div class="card-body">
					    <h5 class="card-title"><%=rs.getString(2)%></h5>
					    <p class="card-text"><%=rs.getString(4) %></p>
					    <a href="Display.jsp?pid=<%=rs.getInt(1) %>" class="btn btn-success">See Profile</a>
 						</div>	
				</div>
			</div>
		
		
	<% 	
	}
	%></div>
	</div>
	</section><%
	//session.setAttribute("List",list);
}
catch(Exception e)
{
	out.println("Some exception here "+e);
}
%>
<%@ include file="footer.jsp" %>
</body>
</html>