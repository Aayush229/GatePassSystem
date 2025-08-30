<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="db.jsp" %>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
 <style>
 		*{
 			margin: 0;
        	padding : 0;
 		}
        body {
       	
            font-family: Arial, sans-serif;
            background: #e9ecef;
          	align-items: center;
          	position: relative;
           
        }
        .register-container{
        	
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
            Z-index: 1;
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
	String message = " ";
	
	if(request.getParameter("register")!=null){
		String rollno = request.getParameter("rollno");
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		PreparedStatement ps = conn.prepareStatement("select * from users where rollno = ?");
		ps.setString(1, rollno);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			out.println("<div class='message'>Already Registered </div>");
		}else {
			PreparedStatement pse = conn.prepareStatement("insert into users (rollno, username, password ) value(?,?,?)");
			pse.setString(1, rollno);
			pse.setString(2, name);
			pse.setString(3, password);
			int result = pse.executeUpdate();
			if(result > 0){
				response.sendRedirect("Login.jsp");
				message = "Registration Successful";
			
			} 
		}
	}
	
	%>
	
	
	<div class="register-container">
	<div class="login-container">
	<h2>Register Form</h2> 
	<Form  method="post">
	Roll no  <input type="text" name="rollno" required> <br/> 
	Username  <input type="text" name="username" required> <br/>
	Password  <input type="text" name="password" required> <br/>

	<input type="Submit" name ="register"  class="btn btn-primary" value="Register">
  	<div class="back-link">
            <p>If your already have a account <a href="Login.jsp">login</a></p>
        </div>

	</Form>
	</div>
	</div>
</body>
</html>