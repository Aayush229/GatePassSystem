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
        body {
       		margin: 0;
        	padding : 0;
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
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 400px;
          	margin: 90px;
            Z-index: 1;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
		input[type="text"],
        input[type="password"] {
            width: 100%;
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
      	 top : 20px;
        text-align: center;
        align-items: center;
        position: relative;
        font-weight: bold ;
        font-size: 30px;
        color: red;'
        Z-index: 1000; 
        }

        
    </style>
</head>
<body>
	
	
	<%
	String message = " ";
	
	if(request.getParameter("register")!=null){
		String unique_code = request.getParameter("unique_code");
		String hname = request.getParameter("hname");
		String password = request.getParameter("password");
		PreparedStatement ps = conn.prepareStatement("select * from hod where unique_code = ?");
		ps.setString(1, unique_code);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			out.println("<div class='message'>Already Registered </div>");
		}else {
			PreparedStatement pse = conn.prepareStatement("insert into hod (unique_code, hname, password ) value(?,?,?)");
			pse.setString(1, unique_code);
			pse.setString(2, hname);
			pse.setString(3, password);
			int result = pse.executeUpdate();
			if(result > 0){
				response.sendRedirect("HodLogin.jsp");
				message = "Registration Successful";
			
			} 
		}
	}
	
	%>
	
	
	<div class="register-container">
	<div class="login-container">
	<h2>Register Form</h2> 
	<Form  method="post">
	Unique code  <input type="text" name="unique_code" required> <br/> 
	Username  <input type="text" name="hname" required> <br/>
	Password  <input type="text" name="password" required> <br/>

	<input type="Submit" name ="register"  class="btn btn-primary" value="Register">
  	<div class="back-link">
            <p>If your already have a account <a href="HodLogin.jsp">login</a></p>
        </div>

	</Form>
	</div>
	</div>
</body>
</html>