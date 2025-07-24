<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xác nhận thanh toán</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: gray-100;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #ffffff;
            gap: 40px; /* khoảng cách giữa ảnh và form */
            padding: 20px;
        }

        .image-frame {
            width: 350px;
            height: 450px;
            border: 2px solid #FF6600;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .image-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .confirm-box {
            background-color: #ffffff;
            border: 2px solid #FF6600;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 400px;
        }

        .confirm-box h2 {
            color: #002B8D;
            margin-bottom: 20px;
        }

        .confirm-box p {
            margin-bottom: 20px;
            font-size: 16px;
        }

        .confirm-box button {
            background-color: #FF6600;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .confirm-box button:hover {
            background-color: #002B8D;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<%
    String bookingId = request.getParameter("bookingId");
    String email = request.getParameter("email");
%>
<div class="container">
    <!-- Hình ảnh bên trái -->
    <div class="image-frame">
        <img src="images/QR.png" alt="QR Code hoặc Tour Image" />
    </div>

    <!-- Hộp xác nhận bên phải -->
    <div class="confirm-box">
        <h2>Xác nhận thanh toán</h2>
        <form action="${pageContext.request.contextPath}/confirmPayment" method="post">
            <input type="hidden" name="bookingId" value="<%= bookingId %>"/>
            <input type="hidden" name="email" value="<%= email %>"/>
            <p>Quét mã QR bên để tiếp tục thanh toán!</p>
            <button type="submit">Xác nhận thanh toán</button>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
