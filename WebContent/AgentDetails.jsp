<%@page import="com.mit.realstate.impl.OwnerName"%>
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
String agentIDString=request.getParameter("agentID");
int agentID = Integer.parseInt(agentIDString);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
	Statement st = conn.createStatement();
	String sql= "Select * from agent where agent_id ="+agentID;
	ResultSet rs = st.executeQuery(sql);
	while(rs.next())
	{
		session.setAttribute("agentName",rs.getString(2));
 		%>				  
	<section class="my-5">
	<form name="contact" action="Scheduler.jsp"  method="post">
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-12">
			<img src="http://localhost:8080/RealEstate/displayAgentImage.jsp?agentID=<%=rs.getInt(1)%>" class="img-fluid displayimg" >
		</div>
			<div class="col-lg-6 col-md-6 col-12">
				<h2><%out.println(rs.getString(2)+" "+rs.getString(3)); %></h2>
				<h3> City: <%out.println(rs.getString(4)); %></h3>
				<label for="appointment">Schedule Appointment:</label>
				<input type="datetime-local" name="appointment"><br>
				
				<%session.setAttribute("date",request.getParameter("appointment")); %>
				<button type="submit" class="btn btn-success">Schedule</button>
				
			</div>
		</div>
	</div>
	</form>
</section>
		<%
	}
}
catch(Exception e)
{
	out.println(e);
}

%>

<%@include file="footer.jsp" %>
</body>
</html>