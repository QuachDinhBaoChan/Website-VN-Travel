<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Trang ADMIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            padding: 100px;
        }
        h2 {
        margin-top:20px;
                    color: #002B8D;
                    font-size: 2rem;
                    text-align: center;
                    margin-bottom: 30px;
                    font-weight: 600;
                }
        .button {
            display: block;
            width: 300px;
            margin: 30px auto;
            padding: 20px;
            font-size: 18px;
            cursor: pointer;
            background-color:#002B8D;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
        }
        .button:hover {
            background-color: #FF6600;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
    <h2>Trang quản trị</h2>
    <a href="${pageContext.request.contextPath}/pendingBookings" class="button">Xem danh sách tour chờ duyệt</a>
</body>
</html>