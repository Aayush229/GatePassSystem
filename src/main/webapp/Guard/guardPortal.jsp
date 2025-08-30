<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
     <%@ include file ="db.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
   

    try {
    	
      PreparedStatement stmt = conn.prepareStatement("SELECT * FROM ApplyGatePass WHERE final_status = 'Approved' ORDER BY final_date_time DESC");
      ResultSet rs = stmt.executeQuery();
%>

<table border="1" style="margin: auto; margin-top: 50px;">
    <tr>
        <th>Name</th>
        <th>Roll No</th>
        <th>Branch</th>
        <th>Semester</th>
        <th>Reason</th>
        <th>Exit-date-time</th>
    </tr>
<%
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("sname") %></td>
        <td><%= rs.getString("rollno") %></td>
        <td><%= rs.getString("branch") %></td>
        <td><%= rs.getString("sem_year") %></td>
        <td><%= rs.getString("reason") %></td>
      <td><%= rs.getString("final_date_time") %></td>
    </tr>
<%
    }
%>
</table>

<%
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } 
%>
</body>
</html>