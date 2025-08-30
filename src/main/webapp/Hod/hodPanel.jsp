<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
    <%@ include file="db.jsp"  %>
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

.panel-heading {
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

.dropdown {
    padding: 6px;
    width: 100%;
    border-radius: 4px;
    border: 1px solid #ccc;
    margin-bottom: 6px;
}

.remark-box {
    width: 100%;
    padding: 8px;
    resize: vertical;
    height: 60px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn-submit {
    padding: 6px 14px;
    background-color: #27ae60;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 5px;
}

.btn-submit:hover {
    background-color: #1e8449;
}
</style>
</head>
<body>
	<h2 class="panel-heading"> Pending Gate Pass Request</h2>
	<table class="styled-table">
	<tr>
	<th>Full Name</th>
	<th>Roll no</th>
	<th>Branch</th>
	<th>Sem-year</th>
	<th>Date-Time</th>
	<th>Contact no</th>
	<th>Reason</th>
	</tr>
	<%
	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("Select * from ApplyGatePass where status_hod ='Panding' ");
	
		while(rs.next()){
			%>	
			<tr>
			<form action="<%= request.getContextPath() %>/HodActionServlet" method="post" class="action-form">
			
			<td><%= rs.getString("sname") %></td>
			<td><%= rs.getString("rollno") %></td>
			<input type="hidden" name="rollno" value="<%= rs.getString("rollno") %>">
			<td><%= rs.getString("branch") %></td>
			<td><%= rs.getString("sem_year") %></td>
			<td><%= rs.getTimestamp("date_time") %></td>
			<td><%= rs.getString("contact") %></td>
			<td><%= rs.getString("reason") %></td>
			<td>
			<select name="status_hod" class="dropdown">
			<option value="Approved">Approve</option>
			<option value="Rejected">Reject</option>
			</select><br>
			<textarea class="remark-box" name="hod_remark" placeholder="Enter Remarks"></textarea><br>
			
			<input type="submit" value="Submit" class="btn-submit">
			</td>
			</form>
			</tr>	
		<% } %>
	
	</table>
</body>
</html>