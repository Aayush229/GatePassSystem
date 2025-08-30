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
	body{
	display: flex;
	justify-content : center;
	align-items: center;
	min-hight: 100vh;
	margin: 0;
	background: linear-gradient(to right, #f1f8ff, #e0f7fa);
	font-family: Arial,sans-serif;
	height: 100vh;
	}
	.container{
	background-color: #fff;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
	text-align: center;
	}
	
	h2{
	margin-bottopm: 20px;
	color: #333
	}
	
	p{
	font-sixe: 18px;
	margin: 10px 0;
	}
	img{
	margin-top: 20px;
	width: 200px;
	hight: 200px;
	}
</style>
</head>
<body>
<%
String roll = (String) session.getAttribute("rollno"); 
if (roll == null) {
    response.sendRedirect("Login.jsp");
    return;
}
%>
<div class="container">
<h2>Gate Pass Status for Roll No: <%= roll %></h2>
			
<%
	
PreparedStatement  ps = conn.prepareStatement("SELECT sname, status_hod, hod_remark, qr_code, approved_time FROM ApplyGatePass WHERE rollno = ? ORDER BY id DESC LIMIT 1");
    ps.setString(1, roll);
   ResultSet rs = ps.executeQuery();

    if (rs.next()) {
    	String name = rs.getString("sname");
        String status = rs.getString("status_hod");
        String remark = rs.getString("hod_remark");
        String qrData = rs.getString("qr_code");
        String qrTime = rs.getString("approved_time");
     
  %>
        <p><strong>Status:</strong> <%= status %></p>
        <p><strong>Remark:</strong> <%= remark != null ? remark : "No remark" %></p>
       
 <%        if("Approved".equalsIgnoreCase(status)) {	 %> 
       
            <img src="generateQR.jsp?data=<%= qrData %>" alt="QR Code" id="qrImage"/>
            
            <p>QR Code expires in :<span id="timer"></span></p>
            
            <div id="expiredMsg" style="display:none; color:red; font-weight:bold;" >QR code  Expired</div>
            <script> 
            let approveTimeStr ="<%= qrTime %>";
            let approveTime = new Date(approveTimeStr.replace(" ", "T"));
            let expiryTime = new Date(approveTime.getTime() + 30 * 60000);
            
            let timerInterval = setInterval(function() {
			let now = new Date();
			let distance = expiryTime - now;
			if(distance > 0){
			let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			let seconds = Math.floor((distance % (1000 * 60)) / 1000);
			
			document.getElementById("timer").innerHTML = minutes + "m " + seconds + "s";
				
			}
			else{
			clearInterval(timerInterval);
			
			document.getElementById("qrImage").style.display = "none";
			document.getElementById("timer").style.display = "none";
			document.getElementById("expiredMsg").style.display = "block";
			}
            },1000);	
            </script>
        	 <p><strong>Name:</strong> <%= name %></p>
    <%    }  } else {  %>
        <p>No request found.</p>
<%
    }
%>
</div>
</body>
</html>