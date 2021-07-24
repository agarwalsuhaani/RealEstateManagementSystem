package com.mit.realstate.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class OwnerName {

	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	public String getOwnerName(int property_id)
	{
		 String owner_name="";
		try{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
			String sql = "Select owner_name from property where property_id="+property_id;
			 st = conn.createStatement();
			 rs = st.executeQuery(sql);
			
			 while(rs.next())
			 {
				 owner_name=rs.getString(1);
			 }
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return owner_name;
		
	}
	

}
