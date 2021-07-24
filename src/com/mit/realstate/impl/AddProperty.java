package com.mit.realstate.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1617721579)
public class AddProperty extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		Connection conn=null;
		PrintWriter out=null;
		HttpSession session = request.getSession();
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
			String name=request.getParameter("pname");
			String address=request.getParameter("address");
			String price=request.getParameter("price");
			String sqft=request.getParameter("sqft");
			String details=request.getParameter("details");
			String propertyType=request.getParameter("toggle");
			InputStream inputStream=null;
			Part filePart = request.getPart("photo");
			
			
			if(filePart!=null)
			{
				inputStream = filePart.getInputStream();
			}
			
			if(name!=null && address!=null && price!=null && sqft!=null && details != null)
			{
				PreparedStatement st=conn.prepareStatement("insert into `Property`(Property_Name,Property_add,Property_price,SQUARE_FEET,DETAILS,image,TYPE,owner_name) values(?,?,?,?,?,?,?,?)");
				st.setString(1,name);
				st.setString(2,address);
				st.setInt(3,Integer.valueOf(price));
				st.setString(4,sqft);
				st.setString(5,details);
				if(inputStream!=null)
				{
					st.setBlob(6,inputStream);
				}
				st.setString(7,propertyType);
				st.setString(8,(String)session.getAttribute("loggedInUser"));
				int r=st.executeUpdate();
				if(r>0)
				{
					response.sendRedirect("AddProperty.jsp");
					out.println("Record Inserted Successfully");
				}
				
			}
		}
		catch(Exception e)
		{
			out.println("Some exception here "+e);
		}
	}

}
