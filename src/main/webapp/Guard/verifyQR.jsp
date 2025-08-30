<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
     <%@ include file ="db.jsp" %> 
     <%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Style>
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
.success-box{
	text-align: center;
	padding: 30px;
	margin-top:100px;
}
.checkmark{
	font-size: 100px;
	color:green;
}
.message {
	font-size: 24px;
	color:#333;
	margin-top:20px;
	
}
</Style>
</head>
<body>


<%
    String qrCode = request.getParameter("qr_code");
	boolean isSuccess = false;

    if (qrCode != null && !qrCode.isEmpty()) {

        try {
           

            // Step 1: Check if QR is valid and pending
            String checkSql = "SELECT * FROM ApplyGatePass WHERE qr_code = ? AND final_status = 'Panding'";
         PreparedStatement pst = conn.prepareStatement(checkSql);
            pst.setString(1, qrCode);
            ResultSet rs= pst.executeQuery();

            if (rs.next()) {
                // Get data from gate_pass
                String name = rs.getString("sname");
                String rollno = rs.getString("rollno");
                String branch = rs.getString("branch");
                String sem = rs.getString("sem_year");

                // Step 2: Update gate_pass final_status
                String updateSql = "UPDATE ApplyGatePass SET final_status = 'Approved', final_date_time = now() WHERE qr_code = ?";
                pst = conn.prepareStatement(updateSql);
                pst.setString(1, qrCode);
             int updated =  pst.executeUpdate();
						if(updated > 0){
							isSuccess = true;
						}
            } else {
                out.print("<h3 class='message'>❌ Invalid or Already Approved QR!</h3>");
            }
        } catch (Exception e) {
            out.print("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.print("<h3>No QR code received!</h3>");
    }
%>
<div class="sucess-box">
<%	if(isSuccess) { %>
	<div class="checkmark">&#10004;</div>
	<div class="message">Scan Successfully!</div>
<% }  %><div class="message" ></div>
</div>

</body>
</html>