package com.GatePassSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/HodActionServlet")
public class HodActionServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

	    String rollno = request.getParameter("rollno");
	    String remarks = request.getParameter("hod_remark");
	    String status = request.getParameter("status_hod");

	    String qrCodeValue = null;
	    if(status.equals("Approved")) {
	        int random = (int)(Math.random() * 9000) + 1000;
	        qrCodeValue = rollno + "_" + random;
	    }

	    try {
	        Connection con = Dbconnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE ApplyGatePass SET status_hod = ?,  hod_remark = ?, qr_code = ?, approved_time = NOW() WHERE rollno = ?"
	        );

	        ps.setString(1, status);
	        ps.setString(2, remarks);
	        ps.setString(3, qrCodeValue); // null if rejected
	        ps.setString(4, rollno);

	        int rows = ps.executeUpdate();
	        if (rows > 0) {
	            response.sendRedirect("Hod/hodPanel.jsp?msg=" + status);
	        } else {
	            response.sendRedirect("Hod/hodPanel.jsp?msg=Error");
	        }

	        ps.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}

