<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import ="java.sql.*" %>
   <%@ include file ="db.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
		*{
    		margin: 0px;
    		padding: 0px;
		}
        body {
        
            font-family: Arial, sans-serif;
            background: #e9ecef;
           position: relative; 
            align-items: center;
           
        }
        .lo-container{
        	display: flex;
            justify-content: center;
            align-items: center;
           	position: relative;
        	
        }

        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 400px;
            margin: 60px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
		input[type="text"],
        input[type="password"] {
            width: 95%;
            padding: 12px;
            margin: 8px 0 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            text-align: center;
            margin-top: 10px;
        }

        .back-link a {
            color: #007bff;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
        .message{
      	 top : 50px;
        text-align: center;
        align-items: center;
        position: relative;
        font-weight: bold ;
        font-size: 20px;
        color: red;'
        Z-index: 1000; 
        }

        
    </style>
</head>
<body>
	
<%
	if(request.getParameter("login")!=null){
		String roll = request.getParameter("rollno");
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		
		PreparedStatement ps = conn.prepareStatement("select * from users where rollno=? and username=? and password=?");
		ps.setString(1, roll);
		ps.setString(2, name);
		ps.setString(3, password);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			session.setAttribute("rollno",roll);
			session.setAttribute("username",name);
			
			response.sendRedirect("Welcome.jsp");
		}else{
			out.println("<div class='message'>invalied login </div>");
		}
	}


%>
 	
<div class="lo-container">
	<div class="login-container">
	<h2>Login Form</h2>
		
	<Form  method="post"> 
	Roll no  <input type="text" name="rollno" required> <br/>
	Username  <input type="text" name="username" required> <br/>
	Password  <input type="text" name="password" required> <br/>
	<input type="Submit" name ="login"  class="btn btn-primary" value="Login">
  	<div class="back-link">
            <p>don't have an account <a href="Register.jsp">Register</a></p>
        </div>

	</Form>
	</div>
	</div>
</body>
</html>