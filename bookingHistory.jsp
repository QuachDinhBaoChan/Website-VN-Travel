<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đặt tour</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .booking-card {
            border: 1px solid #f4a261;
            border-radius: 15px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: white;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }
        .pay-button {
            background-color: #002B8D;
            color: white;
            padding: 5px 15px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.2s ease;
            display: inline-block;
            margin-top:0px;
        }
        .pay-button:hover {
            background-color: #FF6600;
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .body-wrapper {
            font-family: Arial, sans-serif;
            margin: 80px 210px;
            padding: 0px;
        }
        .pre-btn {
            background-color: white;
            color: #FF6600;
            padding: 5px 15px;
            border: 1px solid #FF6600;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease;
            display: inline-block;
            margin-top:17px;
        }
        .pre-btn:hover {
            background-color: #FF6600;
            color: white;
        }
        .load-btn {
            background-color: #002B8D;
            color: white;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease;
            display: inline-block;
            margin-top:17px;
        }
        .load-btn:hover {
            background-color: #FF6600;
        }
        .highlight {
            color: #FF6600;
            font-weight: 600;
        }
    </style>
</head>

<jsp:include page="navbar.jsp" />
<jsp:include page="contact-floating.jsp" />

<body class="bg-gray-100 font-sans">
<div class="body-wrapper">
    <div class="container mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">Lịch sử đặt tour</h2>

        <!-- Thông báo không có đơn -->
        <c:if test="${empty userBookings}">
            <p class="text-center text-red-600 text-lg mb-6">Không tìm thấy lịch sử đặt tour.</p>
        </c:if>

        <!-- Danh sách đơn đặt -->
        <c:if test="${not empty userBookings}">
            <div class="space-y-4">
                <c:forEach var="booking" items="${userBookings}">
                    <div class="booking-card fade-in">
                        <div class="flex-1 min-w-[200px]">
                            <h3 class="text-xl font-semibold" style="color: #002B8D;">
                                ${not empty booking.tour ? booking.tour.name : '-'}
                            </h3>
                            <div class="flex flex-col md:flex-row md:space-x-4 mt-2">
                                <div class="flex-1">
                                    <p><strong>Tên:</strong> <span class="highlight">${not empty booking.fullName ? booking.fullName : '-'}</span></p>
                                    <p><strong>Email:</strong> <span class="highlight">${not empty booking.email ? booking.email : '-'}</span></p>
                                </div>
                                <div class="flex-1">
                                    <p><strong>Ngày đặt:</strong>
                                        <fmt:formatDate value="${booking.bookingDateAsDate}" pattern="dd/MM/yyyy" var="formattedDate" />
                                        <span class="highlight">${not empty formattedDate ? formattedDate : '-'}</span>
                                    </p>
                                    <p><strong>Số lượng người:</strong> <span class="highlight">${booking.numberOfPeople != null ? booking.numberOfPeople : '-'}</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="flex flex-col items-end space-y-2">
                            <div class="flex items-center space-x-2">
                                <p><strong>Trạng thái:</strong></p>
                                <c:choose>
                                    <c:when test="${booking.status == 'Approved'}">
                                        <a href="${pageContext.request.contextPath}/confirm.jsp?bookingId=${booking.id}&email=${sessionScope.user.email}" class="pay-button">
                                            Thanh toán
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="highlight">
                                            <c:choose>
                                                <c:when test="${booking.status == 'Paid'}">Đã thanh toán</c:when>
                                                <c:when test="${booking.status == 'Rejected'}">Bị từ chối</c:when>
                                                <c:when test="${booking.status == 'Approved'}">Đã được duyệt</c:when>
                                                <c:otherwise>${booking.status}</c:otherwise>
                                            </c:choose>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <c:if test="${booking.status == 'Rejected'}">
                                <p><strong>Lý do bị hủy:</strong> <span class="highlight">${not empty booking.rejectionReason ? booking.rejectionReason : '-'}</span></p>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Nút quay lại và tải lại -->
        <div class="flex justify-center space-x-4 mt-6">
            <button onclick="window.location.reload()" class="load-btn">
                Tải lại lịch sử
            </button>
            <a href="${pageContext.request.contextPath}/booking" class="pre-btn">
                ← Quay lại trang đặt tour
            </a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
