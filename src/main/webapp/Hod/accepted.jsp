<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import ="java.sql.*" %>
   <%@ include file ="db.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 30px;
    background-color: #f4f6f9;
    color: #333;
}

.accept-heading {
    font-size: 24px;
    color: #2c3e50;
    margin-bottom: 20px;
    text-align: center;
}

.styled-table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.styled-table th, .styled-table td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.styled-table th {
    background-color: #2c3e50;
    color: #fff;
}

.action-form {
    display: contents;
}
</style>

</head>
<body>
	
<h2 class="accept-heading"> Approved Gate Pass Request</h2>
	<table class="styled-table">
	<tr>
	<th>Full Name</th>
	<th>Roll no</th>
	<th>Branch</th>
	<th>Sem-year</th>
	<th>Date-Time</th>
	<th>Contact no</th>
	<th>Reason</th>
	<th>Status</th>
	</tr>
	
	<%
	PreparedStatement ps = conn.prepareStatement("Select * from ApplyGatePass where status_hod ='Approved' ORDER BY date_time DESC");
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
		%>	
		<tr>
		<form class="actionform">
			<td><%= rs.getString("sname") %></td>
			<td><%= rs.getString("rollno") %></td>
			
			<td><%= rs.getString("branch") %></td>
			<td><%= rs.getString("sem_year") %></td>
			<td><%= rs.getTimestamp("date_time") %></td>
			<td><%= rs.getString("contact") %></td>
			<td><%= rs.getString("reason") %></td>
			<td><%= rs.getString("status_hod") %></td>
			<td><%= rs.getString("hod_remark") %></td>
			</form>
		</tr>
		
	<% } %>
	
	
</body>
</html>