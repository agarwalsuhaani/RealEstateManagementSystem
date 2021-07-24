<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mit.realstate.impl.OwnerName" %>
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
	OwnerName ownerName = new OwnerName();
	Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
	try
	{
		PreparedStatement stmt=conn.prepareStatement("insert into `appointment`(agent_name,date_and_time,property_id,client_name,owner_name) values(?,?,?,?,?)");
		int property_id = (int)session.getAttribute("property_ID");
		String agentName = (String)session.getAttribute("agentName");
		String date_time= request.getParameter("appointment");
		String date_time_arr[]=date_time.split("T");
		String date =date_time_arr[0];
		String time= date_time_arr[1];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(date);
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		String final_date = sdf2.format(d);
		System.out.println(final_date);
		System.out.println(date);
		System.out.println(time);
		stmt.setString(1,agentName);
		stmt.setString(2,final_date+" "+time);
		stmt.setInt(3,property_id);
		stmt.setString(4,(String)session.getAttribute("loggedInUser"));
		stmt.setString(5,ownerName.getOwnerName(property_id));
		int r=stmt.executeUpdate();
		if(r>0)
		{
			response.sendRedirect("index.jsp");			
			out.println("Schedule added Successfully");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	
%>
