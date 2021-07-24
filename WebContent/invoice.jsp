<!DOCTYPE html>
<%@page import="com.mit.realstate.impl.PropertyDetails"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/favicon.png" rel="icon" />
<title>Property Invoice- MagicBricks</title>
<meta name="author" content="harnishdesign.net">

<!-- Web Fonts
======================= -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>

<!-- Stylesheet
======================= -->
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="vendor/font-awesome/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="CSS/styleinvoice.css">
</head>
<body>
<%
String img_path;
Connection conn=null;
String propertyIDString=request.getParameter("propertyID");
int propertyID = Integer.parseInt(propertyIDString);
Date d = new Date();
PropertyDetails propertyDetails = new PropertyDetails();
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
	Statement st = conn.createStatement();
	String sql= "Select * from appointment where property_id ="+propertyID;
	ResultSet rs = st.executeQuery(sql);
	propertyDetails.setDetails(propertyID);
	while(rs.next())
	{
		
 		%>				  
	<div class="container-fluid invoice-container">
  <!-- Header -->
  <header>
  <div class="row align-items-center">
    <div class="col-sm-7 text-center text-sm-left mb-3 mb-sm-0">
      <img id="logo" src="images/logo.png" title="MagicBricks" alt="Koice" />
    </div>
    <div class="col-sm-5 text-center text-sm-right">
      <h4 class="text-7 mb-0">Invoice</h4>
    </div>
  </div>
  <hr>
  </header>
  
  <!-- Main Content -->
  <main>
  <div class="row">
    <div class="col-sm-6"><strong>Date:</strong><%=d %></div>
    <div class="col-sm-6 text-sm-right"> <strong>Invoice No:</strong><%=16835+propertyID %></div>
	  
  </div>
  <hr>
  <div class="row">
    <div class="col-sm-6 text-sm-right order-sm-1"> <strong>Invoiced To:</strong>
      <address>
      <%=rs.getString(4) %><br />
	  contact@magiccement.com
      </address>
    </div>
    <div class="col-sm-6 order-sm-0"> <strong>Property Details:</strong>
      <address>
       <%=rs.getString(5)%><br />
      	<%=propertyDetails.getProperty_name()%><br/>
      	<%=propertyDetails.getType() %><br/>
      	<%=propertyDetails.getProperty_address() %>
      	
      </address>
    </div>
  </div>  
  <div class="card">
    <div class="card-header px-2 py-0">
      <table class="table mb-0">
        <thead>
          <tr>
            <td class="col-3 border-0"><strong>Service</strong></td>
			<td class="col-4 border-0"><strong>Description</strong></td>
            <td class="col-2 text-right border-0"><strong>Amount</strong></td>
          </tr>
        </thead>
      </table>
    </div>
    <div class="card-body px-2">
      <div class="table-responsive">
        <table class="table">
          <tbody>
            <tr>
              <td class="col-3 border-0">Property price</td>
              <td class="col-4 text-1 border-0">Property price excluding tax</td>
			  <td class="col-2 text-right border-0">$<%=propertyDetails.getPrice() %></td>
            </tr>
            <tr>
              <td>Magic Cement fees</td>
              <td class="text-1">Charges include agent and magic cement fees</td>
			  <td class="text-right">$<%=(propertyDetails.getPrice())*5/100 %></td>
            </tr>
            <tr>
              <td colspan="4" class="bg-light-2 text-right"><strong>Sub Total:</strong></td>
              <td class="bg-light-2 text-right">$<%=(propertyDetails.getPrice())*105/100 %></td>
            </tr>
            <tr>
              <td colspan="4" class="bg-light-2 text-right"><strong>Tax:</strong></td>
              <td class="bg-light-2 text-right">$<%=((propertyDetails.getPrice())*105/100)*5/100 %></td>
            </tr>
            <tr>
              <td colspan="4" class="bg-light-2 text-right"><strong>Total:</strong></td>
              <td class="bg-light-2 text-right">$<%=((propertyDetails.getPrice())*105/100)*105/100 %></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  </main>
		<%
	}
}
catch(Exception e)
{
	out.println(e);
}

%>


  <!-- Footer -->
  <footer class="text-center mt-4">
  <p class="text-1"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>
  <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none"><i class="fa fa-print"></i> Print</a> <a href="http://localhost:8080/RealEstate/invoice.jsp?propertyID=<%=propertyID %>"  class="btn btn-light border text-black-50 shadow-none" download><i class="fa fa-download"></i> Download</a> </div>
  </footer>
</div>
</body>
</html>