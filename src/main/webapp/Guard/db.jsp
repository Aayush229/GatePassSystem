<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	String url ="jdbc:mysql://localhost:3306/gatepasssystem?";
	String dbUser = "root";
	String dbPass ="623280";
	Connection conn = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbUser,dbPass);
		
	}catch(Exception e ){
		out.println("DB Error : "+ e);
	}
%>