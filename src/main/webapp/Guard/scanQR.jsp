<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>QR Scanner</title>
    <script src="https://unpkg.com/html5-qrcode"></script>
    <style >
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
    .aa{
   
    }
    </style>
</head>
<body>
   <div> <h2>Scan QR Code</h2>

    <div id="camera-selection"></div>
    <div id="reader" style="width:300px;"></div>
    <div id="result"></div>

    <!-- Hidden form to POST data -->
    <div class="aa">
    <form id="qrForm" action="verifyQR.jsp" method="post">
        <input type="hidden" name="qr_code" id="qr_code">
    </form>
    </div>
	</div>
    <script>
        let html5QrCode;

        // Step 1: Get all cameras
        Html5Qrcode.getCameras().then(cameras => {
            if (cameras.length) {
                const select = document.createElement("select");

                cameras.forEach(cam => {
                    const option = document.createElement("option");
                    option.value = cam.id;
                    option.text = cam.label || `Camera ${cam.id}`;
                    select.appendChild(option);
                });

                document.getElementById("camera-selection").appendChild(select);
                select.onchange = () => startScanner(select.value);
                startScanner(cameras[0].id);
            }
        });

        // Step 2: Start scanner
        function startScanner(cameraId) {
            if (html5QrCode) {
                html5QrCode.stop().then(() => {
                    startWithCamera(cameraId);
                });
            } else {
                startWithCamera(cameraId);
            }
        }
        
      
        // Step 3: Function to scan and send via POST
        function startWithCamera(cameraId) {
            html5QrCode = new Html5Qrcode("reader");

            html5QrCode.start(
                cameraId,
                {
                    fps: 10,
                    qrbox: { width: 250, height: 250 }
                },
                qrCodeMessage => {
                    html5QrCode.stop(); // Stop camera
                    document.getElementById("result").innerText = "Scanned: " + qrCodeMessage;

                    // Step 4: Submit form with QR data
                    document.getElementById("qr_code").value = qrCodeMessage;
                    document.getElementById("qrForm").submit();
                },
                error => {
                    // Ignore scan error
                }
            ).catch(err => {
                document.getElementById("result").innerText = "Error: " + err;
            });
        }
    </script>
</body>
</html>