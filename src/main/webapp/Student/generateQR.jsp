<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*, javax.imageio.ImageIO" %>
<%@ page import="com.google.zxing.BarcodeFormat" %>
<%@ page import="com.google.zxing.WriterException" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter" %>
<%@ page import="com.google.zxing.common.BitMatrix" %>
<%@ page import="com.google.zxing.client.j2se.MatrixToImageWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    String data = request.getParameter("data");

    if (data == null || data.trim().isEmpty()) {
        out.println("data number is missing");
        return;
    }

    // Generate QR content
    String qrContent = data;

    // QR Code dimensions
    int width = 250;
    int height = 250;

    // Set response type
    response.setContentType("image/png");

    try {
        QRCodeWriter qrWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrWriter.encode(qrContent, BarcodeFormat.QR_CODE, width, height);

        // Stream image to browser
        OutputStream os = response.getOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", os);
        os.close();

    } catch (WriterException we) {
        out.println("QR Generation Error: " + we.getMessage());
    } catch (IOException ioe) {
        out.println("IO Error: " + ioe.getMessage());
    }
%>




</body>
</html>



