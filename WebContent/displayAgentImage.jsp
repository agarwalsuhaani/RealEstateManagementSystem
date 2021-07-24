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
	String sql = "Select image from agent where agent_id="+request.getParameter("agentID");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	byte[] imgData=null;
	
	while(rs.next())
	{
		Blob blob = rs.getBlob(1);
		imgData = blob.getBytes(1, (int) blob.length());
		}
	response.setContentType("image/png");
	OutputStream os = response.getOutputStream();
	os.write(imgData);
	os.flush();
	os.close();
	rs.close();
	st.close();
	conn.close();
	
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