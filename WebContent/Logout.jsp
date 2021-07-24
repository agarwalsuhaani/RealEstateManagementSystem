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
	session.invalidate();
	response.sendRedirect("index.jsp");

%>