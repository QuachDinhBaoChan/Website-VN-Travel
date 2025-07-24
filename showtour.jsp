<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.entity.Tour" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Tour</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .body-wrapper {
            font-family: Arial, sans-serif;
            margin-top: 0px;
        }

        h2 {
             text-align: center;
                        color: #555;
                        font-size: 24px;
                        font-weight: bold;
                        font-family: Arial, sans-serif;
                        
                        border-bottom: 3px solid #FF6600;
                        display: inline-block;
                        padding-bottom: 5px;
                        margin-bottom: 40px;
            }

        .body-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .tour-container {
            display: grid;
            grid-template-columns: repeat(4, 250px);
            gap: 20px;
            justify-content: center;
        }

        .tour-card {
            border: 1px solid #FF6600;
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            text-align: center;
            transition: transform 0.2s;
            font-size: 14px;
            height: 380px;
            width: 250px;

        }

        .tour-card:hover {
            transform: translateY(-5px);
        }

        .tour-card img {
            width: 100%; /* Full width of the card (250px) */
                height: 200px; /* Fixed height */
                object-fit: cover; /* Crops excess parts to fill the 250x200px area */
                object-position: center; /* Centers the image for cropping */
                background-color: #ccc;
        }

        .tour-card .price {
            font-size: 16px;
            color: #e91e63;
            margin: 8px 0;
        }

        .tour-card .details {
            padding: 10px 12px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center content vertically */
        }

        .tour-card .details p {
            margin: 5px 0;
            color: #002B8D;
            font-size: 20px;
        }

        .tour-card .view-btn {
            background-color: transparent;
            color: #FF6600;
            padding: 5px 14px;
            text-decoration: none;
            border-radius: 8px;
            margin: 10px auto 15px;
            font-size: 13px;
            border: 1px solid #FF6600;
        }

        .tour-card .view-btn:hover {
            background-color: #FF6600;
            color: white;
        }

        .tour-card .duration {
            display: flex;
            align-items: center;
            justify-content: center; /* Center icon and text horizontally */
            gap: 6px;
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .tour-card .duration i {
            font-size: 16px;
        }

        .center-wrapper {
          display: flex;
          justify-content: center; /* Canh giữa ngang */
        }

        .booking-btn {
          margin:50px;
          display: inline-block;
          padding: 5px 20px;
          background-color: transparent; /* Nền trong suốt */
          color: #FF6600;
          text-decoration: none;
          border-radius: 6px;
          font-weight: bold;
          font-size: 25px;
          font-family: Arial, sans-serif;
          border: 1px solid #FF6600; /* Viền rõ ràng */
          transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
          text-align: center;
        }



        .booking-btn:hover {
          background-color: #FF6600;
          color: white;
        }

    </style>

</head>
<body>
<div class="center-wrapper">
  <a href="${pageContext.request.contextPath}/booking" class="booking-btn">Đặt Tour Ngay</a>
</div>
<div class="center-wrapper">
<h2>TOUR NỔI BẬT</h2>
</div>
<div class="body-wrapper">
<div class="body-container">
    <div class="tour-container">
        <c:forEach var="tour" items="${applicationScope.allTours}" begin="0" end="3">
            <div class="tour-card">
                <img src="${tour.imageUrl}" alt="${tour.name}" onerror="this.src='images/default.jpg'">
                <div class="details">
                    <p><strong>${tour.name}</strong></p>
                    <div class="duration">
                        <i class="fa-regular fa-clock"></i>
                        <span>${tour.duration} ngày</span>
                    </div>
                </div>
                <div class="price">$${tour.price}</div>
                <a href="tourDetail?id=${tour.id}" class="view-btn">Xem chi tiết</a>
            </div>
        </c:forEach>
    </div>
</div>
</div>
<div class="center-wrapper">
  <a href="booking" class="booking-btn" style="color:white; background-color:#FF6600; margin-top:40px; font-size:20px">Xem tất cả</a>
</div>

</body>
</html>