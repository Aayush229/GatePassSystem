package com.GatePassSystem;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnection {

	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepassSystem","root","623280");
			
		}
		catch(Exception e){
			System.out.println("Connection failled"+e.getMessage());
			
		}
		return conn;
	}
	}

