<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Adventure Tours</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .body-wrapper {
                    font-family: Arial, sans-serif;
                    margin: 5px 0;
                    padding: 0px;
                }

                h2 {
                    text-align: center;
                    margin: 10px 0;
                    color: #555;
                    font-family: Arial, sans-serif;
                    text-decoration: underline;
                    text-decoration-color: #FF6600;   /* Màu gạch chân */
                    margin-top:150px;
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
                  margin-top:20px;
                  display: inline-block;
                  padding: 5px 20px;
                  background-color: transparent; /* Nền trong suốt */
                  color: #FF6600;
                  text-decoration: none;
                  border-radius: 6px;
                  font-weight: bold;
                  font-size: 22px;
                  font-family: Arial, sans-serif;
                  border: 1px solid #FF6600; /* Viền rõ ràng */
                  transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
                  text-align: center;
                }

                .booking-btn:hover {
                  background-color: #FF6600;
                  color: white;
                }
                .details p.description {
                            margin: 5px 0;
                            font-size: 13px;
                            color: #444;
                        }

                        .details p.start-date {
                            font-size: 13px;
                            color: #333;
                        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="contact-floating.jsp" />
<h2>TOUR HISTORICAL</h2>
<div class="body-wrapper">
    <div class="body-container">
        <div class="tour-container">
            <c:forEach var="tour" items="${applicationScope.allTours}">
                <c:if test="${tour.category != null && fn:toLowerCase(tour.category) == 'historical'}">
                    <div class="tour-card">
                        <img src="${tour.imageUrl}" alt="${tour.name}" onerror="this.src='images/default.jpg'">
                        <div class="details">
                            <p class="name">${tour.name}</p>
                            <div class="duration">
                                <i class="fa-regular fa-clock"></i>
                                <span>${tour.duration} ngày</span>
                            </div>

                            <p class="description">
                                <c:choose>
                                    <c:when test="${fn:length(tour.description) > 100}">
                                        ${fn:substring(tour.description, 0, 100)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${tour.description}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="price">
                            <fmt:formatNumber value="${tour.price}" type="currency" currencySymbol="$" />
                        </div>
                        <a href="tourDetail?id=${tour.id}" class="view-btn">Xem chi tiết</a>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
