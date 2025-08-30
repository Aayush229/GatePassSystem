<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
margin: 0;
padding: 0;
}
.back{

background-color: rgba(0,0,0,0.5);
background-image:url('vikrant.jpg');
background-size:cover;
background-repeat: no-repeat;
background-attachment: fixed;
height: 100vh;
width:100%;
overflow : hidden;
}
.navbar{

background-color: #2c3e50;
overflow: hidden;
padding: 10px 20px;
display: flex;
    justify-content: space-between;	


}
.navbar a{
	
	color:white ;
	padding: 12px;
	text-decoration:none;
	font-weight:bold;
	
}
 . right{
 
}
.welcome{
	
	font-weight: bold;
	font-size: 30px;
	margin: 20px;
}

</style>
</head>
<body>
<% 	String name = (String) session.getAttribute("username");
	
	if(name == null){
	response.sendRedirect("Login.jsp");
	return ; 
	}
	%>
	<div class="back">
	<div class="welcome"><span style="color:black;">Welcome : <%= name %></span></div>
		
		<div class="navbar">
		<div class="right">
		<a href="Apply.jsp">Apply Gate Pass</a>
		<a href="Stutus.jsp">Check Request Status</a>
		
		</div>
		<div class="right">
		
		<a href="<%= request.getContextPath() %>/Logout">Logout</a>
		</div>
		</div>
		</div>
		
</body>
</html>