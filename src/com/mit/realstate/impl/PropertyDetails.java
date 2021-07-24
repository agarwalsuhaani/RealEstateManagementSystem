package com.mit.realstate.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class PropertyDetails {

	private  String property_name;
	private String property_address;
	private  String type;
	private  int price;
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	

	public String getProperty_name() {
		return property_name;
	}

	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}

	public String getProperty_address() {
		return property_address;
	}

	public void setProperty_address(String property_address) {
		this.property_address = property_address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setDetails(int property_id)
	{
		
	
		try{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RealEstate", "root","root");
			String sql = "Select property_name,property_add,type,property_price from property where property_id="+property_id;
			 st = conn.createStatement();
			 rs = st.executeQuery(sql);
			
			 while(rs.next())
			 {
				 property_name=rs.getString(1);
				 property_address=rs.getString(2);
				 type=rs.getString(3);
				 price=rs.getInt(4);
			 }
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
