package com.mit.realstate.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

public class DisplayProperty extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		Connection conn=null;
		PrintWriter out=null;
		List<String> list = new ArrayList<String>();
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
			String sql = "Select * from property";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				byte[] imageData = rs.getBytes(8);
				list.add(Base64.encodeBase64String(imageData));
				
			}
			request.setAttribute("pictureList",list);
		}
		catch(Exception e)
		{
			out.println("Some exception here "+e);
		}
	}

	
}

		