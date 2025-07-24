<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Tour Detail</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background-color: #f5f6fa;
            padding: 20px;
            min-height: 100vh;
            margin-top:60px;
        }

        .tour-detail {
            max-width: 900px;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .tour-detail:hover {
            transform: translateY(-4px);
        }

        .tour-detail img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            display: block;
        }

        .tour-detail .info {
            padding: 30px;
        }

        .tour-detail .info h2 {
            font-size: 2rem;
            color: #2d3436;
            margin-bottom: 20px;
            border-bottom: 2px solid #dfe6e9;
            padding-bottom: 10px;
        }

        .tour-detail .info p {
            margin: 12px 0;
            color: #2d3436;
            line-height: 1.6;
        }

        .tour-detail .info .label {
            font-weight: 600;
            color: #002B8D;
            display: inline-block;
            min-width: 140px;
        }

        .tour-detail .buttons {
            padding: 0 30px 30px;
            display: flex;
            gap: 15px;
        }

        .tour-detail .back-btn, .tour-detail .book-btn {
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .tour-detail .back-btn {
            background-color: #FF6600;
            color: white;
        }

        .tour-detail .back-btn:hover {
            background-color: #de5900;
            transform: translateY(-2px);
        }

        .tour-detail .book-btn {
            background-color: #002B8D;
            color: white;
        }

        .tour-detail .book-btn:hover {
            background-color: #001f66;
            transform: translateY(-2px);
        }

        .booking-form {
            max-width: 450px;
            background-color: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
            display: none;
        }

        .booking-form.active {
            display: block;
        }

        .booking-form h3 {
            font-size: 1.5rem;
            color: #2d3436;
            margin-bottom: 20px;
            text-align: center;
        }

        .booking-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #002B8D;
        }

        .booking-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #dfe6e9;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .booking-form input:focus {
            outline: none;
            border-color: #0984e3;
            box-shadow: 0 0 0 3px rgba(9, 132, 227, 0.1);
        }

        .booking-form button {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .booking-form button[type="submit"] {
            background-color: #002B8D;
            color: white;
            margin-right: 10px;
        }

        .booking-form button[type="submit"]:hover {
            background-color: #001f66;
            transform: translateY(-2px);
        }

        .booking-form button[type="button"] {
            background-color: #00216e;
            color: white;
        }

        .booking-form button[type="button"]:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 999;
        }

        .overlay.active {
            display: block;
        }

        .home-link {
            display: block;
            text-align: center;
            margin: 20px 0;
            color: #0984e3;
            text-decoration: none;
            font-weight: 500;
        }

        .home-link:hover {
            color: #0870c1;
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .tour-detail {
                margin: 20px;
            }

            .tour-detail img {
                height: 300px;
            }

            .tour-detail .info {
                padding: 20px;
            }

            .tour-detail .buttons {
                flex-direction: column;
                gap: 10px;
            }

            .booking-form {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
    <div class="tour-detail">
        <c:if test="${not empty tour}">
            <img src="${tour.imageUrl}" alt="${tour.name}">
            <div class="info">
                <h2>${tour.name}</h2>
                <p><span class="label">Mô tả:</span> ${tour.description}</p>
                <p><span class="label">Giá:</span> $${tour.price}</p>
                <p><span class="label">Danh mục:</span> ${tour.category}</p>
                <p><span class="label">Số người:</span> ${tour.numberOfPeople}</p>
                <p><span class="label">Điểm khởi hành:</span> ${tour.departureLocation}</p>
                <p><span class="label">Ngày khởi hành:</span>
                    <%
                        Object tourObj = pageContext.getAttribute("tour");
                        if (tourObj != null) {
                            java.time.LocalDate departureDate = (java.time.LocalDate) tourObj.getClass().getMethod("getDepartureDate").invoke(tourObj);
                            if (departureDate != null) {
                                java.util.Date departureDateUtil = java.util.Date.from(departureDate.atStartOfDay(java.time.ZoneId.systemDefault()).toInstant());
                                pageContext.setAttribute("departureDateUtil", departureDateUtil);
                            }
                        }
                    %>
                    <c:choose>
                        <c:when test="${not empty departureDateUtil}">
                            <fmt:formatDate value="${departureDateUtil}" pattern="dd/MM/yyyy" />
                        </c:when>
                        <c:otherwise>
                            Chưa có ngày khởi hành
                        </c:otherwise>
                    </c:choose>
                </p>
                <p><span class="label">Điểm đến:</span> ${tour.destination}</p>
                <p><span class="label">Số ngày:</span> ${tour.duration} ngày</p>
            </div>
            <div class="buttons">
                <a href="${pageContext.request.contextPath}/welcome" class="back-btn">Quay lại</a>
                <a href="javascript:void(0)" class="book-btn" onclick="showBookingForm(${tour.id})">Book Now</a>
            </div>
        </c:if>
        <c:if test="${empty tour}">
            <div class="info">
                <p>Không tìm thấy thông tin tour.</p>
            </div>
            <div class="buttons">
                <a href="${pageContext.request.contextPath}/welcome" class="back-btn">Quay lại</a>
            </div>
        </c:if>
    </div>

    <%
        boolean isLoggedIn = session.getAttribute("user") != null;
    %>
    <script>
        const isLoggedIn = <%= isLoggedIn %>;

        function showBookingForm(tourId) {
            if (!isLoggedIn) {
                window.location.href = '${pageContext.request.contextPath}/login.jsp';
                return;
            }

            var form = document.createElement("div");
            form.id = "bookingForm";
            form.className = "booking-form";
            form.innerHTML = `
                <h3>Book Tour</h3>
                <form id="bookingFormSubmit">
                    <input type="hidden" name="tourId" value="${tour.id}">
                    <label for="fullName">Full Name:</label>
                    <input type="text" id="fullName" name="fullName" required>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                    <label for="numberOfPeople">Number of People:</label>
                    <input type="number" id="numberOfPeople" name="numberOfPeople" min="1" max="${tour.numberOfPeople}" required>
                    <label for="bookingDate">Booking Date:</label>
                    <input type="date" id="bookingDate" name="bookingDate" min="${java.time.LocalDate.now()}" required>
                    <button type="submit">Submit Booking</button>
                    <button type="button" onclick="hideBookingForm()">Cancel</button>
                </form>
            `;
            document.body.appendChild(form);

            var overlay = document.createElement("div");
            overlay.id = "overlay";
            overlay.className = "overlay";
            overlay.onclick = hideBookingForm;
            document.body.appendChild(overlay);

            form.classList.add("active");
            overlay.classList.add("active");

            document.getElementById("bookingFormSubmit").addEventListener("submit", function(event) {
                event.preventDefault();
                var formData = new FormData(this);
                fetch('${pageContext.request.contextPath}/submitTourBooking', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    if (data === "success") {
                        alert("Bạn đã đặt tour thành công. vui lòng kiểm tra lịch sử đặt tour !");
                        hideBookingForm();
                        location.reload();
                    } else if (data.startsWith("error:")) {
                        alert(data.substring(6));
                    } else {
                        alert("Booking failed. Please try again.");
                    }
                })
                .catch(error => {
                    console.error('Fetch error:', error);
                    alert("An unexpected error occurred. Please check the console for details.");
                });
            });
        }

        function hideBookingForm() {
            var form = document.getElementById("bookingForm");
            var overlay = document.getElementById("overlay");
            if (form) form.remove();
            if (overlay) overlay.remove();
        }
    </script>

    <jsp:include page="footer.jsp" />
</body>
</html>