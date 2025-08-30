<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
    <%@ include file="db.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert data</title>
<style>
*{
	 margin: 0;
     padding: 0;
}
body {
   
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to right, #f1f8ff, #e0f7fa);
 
    align-items: center;
     min-height: 100vh;
    
   
}

.body1{
  display: flex;
    justify-content: center; 
   
}
.form-box {
 	margin-top: 40px;
    background: #fff;
    padding: 15px 15px;
    border-radius: 16px;
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    max-width: 700px;
    height:470px;
    width: 100%;
}

.form-box h2 {
    text-align: center;
    color: #0d47a1;
    margin-bottom: 10px;
    font-weight: bold;
}

form {
    display: flex;
    gap: 30px;
    flex-wrap: wrap;
}

.form-column {
 	margin: 20px;
    flex: 1;
    min-width: 250px;
}

label {
    display: block;
    margin-bottom: 6px;
    font-weight: 500;
    color: #333;
}

.input {
    width: 80%;
    padding: 8px 10px;
    margin-bottom: 18px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 15px;
    transition: 0.3s ease;
}

.input:focus {
    border-color: #1976d2;
    outline: none;
    box-shadow: 0 0 0 3px rgba(25, 118, 210, 0.2);
}

.button {
   	margin-top: 40px;
    background: #1976d2;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: 0.3s ease;
    height: 40px;
    width: 300px;
    
}

.button:hover {
    background: #0d47a1;
}
@media(max-widht: 800px){
body1{
flex-direction: column;
}
.form-box {
 	
    min-width: 400vw;
    height:770vw;
   
}
}
</style>
</head>
<body>

 <%
 String name = (String) session.getAttribute("username");
 String roll = (String) session.getAttribute("rollno"); 
 
 if(request.getMethod().equalsIgnoreCase("post") ){
    	
   
		String branch = request.getParameter("branch");
		String semyear = request.getParameter("semyear");
		
		String datetime = request.getParameter("datetime");
		String contact = request.getParameter("contact");
		String reason = request.getParameter("reason");
		
		PreparedStatement ps = conn.prepareStatement("INSERT INTO ApplyGatePass ( sname, rollno, branch, sem_year, date_time, contact, reason) VALUES (?, ?, ?, ?, ?, ?, ?)");
		ps.setString(1, name);
		ps.setString(2, roll);
		ps.setString(3, branch);
		ps.setString(4, semyear);
		ps.setString(5, datetime);
		ps.setString(6, contact);
		ps.setString(7, reason);
		
		
		 int rows = ps.executeUpdate();
		if(rows > 0){
			response.sendRedirect("Welcome.jsp");
		}else{
			out.println("Failed to data insert </div>");
		}
	}

    
    %>
    <div class="body1">
	<div class="form-box">
	<h2>Apply Gate Pass</h2>
	<form  method="post">
	<div class="form-column">
	
	 <label for="sname">Full Name</label>
	 <input class="input" type="text" name="sname" value="<%= name %>" readonly/>	
	 
	 <label for="rollno">Roll no</label>
	 <input class="input" type="text" name="rollno" value=" <%= roll %> " readonly />
	 
	 <label for="reason">Reason</label>
	 <textarea class="input"  name="reason" rows="4" placeholder="reason" required ></textarea>
	 
	 <button type="submit" class="button">Submit</button>
	 </div>
	 
	 <div class="form-column">
	  <label for="">Branch</label>
     <select class="input" name="branch" required >
     <option value="CSE">Computer Science (CSE)</option>
     <option value="ME">Mechanical Engineering (ME)</option>
     <option value="ECE">Electronics & Communication (ECE)</option>
     <option value="EE">Electrical Engineering (EE)</option>
     <option value="CE">Civil Engineering (CE)</option>
     </select>
     
	  <label for="mathes">Sem/Year</label>
    <input class="input" type="text" name="semyear" placeholder="Sem-Year" required />
    
	  
	  <label for=""> Date & time</label>
    <input class="input" type="datetime-local" name="datetime"  required />
    
    <label for=""> Contact No</label>
    <input class="input" type="text" name="contact" placeholder="Contact Noumber"  required />
    
    </div>
    
     
    </form>
    </div>
    </div>
    
   
</body>
</html>