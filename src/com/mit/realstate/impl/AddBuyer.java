package com.mit.realstate.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddBuyer extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		Connection conn=null;
		PrintWriter out=null;
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
			
			String name=request.getParameter("Buyername");
			String lastName=request.getParameter("BuyerLastName");
			String city=request.getParameter("Buyercity");
			String password= request.getParameter("Buyerpassword");
			
			
			if(name!=null && lastName!=null && city!=null)
			{
				PreparedStatement st= conn.prepareStatement("insert into `login`(uname,pwd,role) values(?,?,?)");
				st.setString(1,name);
				st.setString(2,password);
				st.setString(3,"client");
				
				int rs= st.executeUpdate();
				if(rs>0)
				{
					response.sendRedirect("index.jsp");
					out.println("Agent added Successfully");
				}
				
			}
		}
		catch(Exception e)
		{
			out.println("Some exception here "+e);
		}
	}

}
