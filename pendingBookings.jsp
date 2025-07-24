<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách tour chờ duyệt</title>
    <style>
        * {

            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
        margin-top: 80px;
            background-color: #f5f6fa;
            padding: 40px;
            min-height: 100vh;
            color: #2d3436;
        }

        h2 {
            color: #002B8D;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .error {
            color: #d63031;
            text-align: center;
            background-color: #ffeef0;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #dfe6e9;
        }

        th {
            background-color: #002B8D;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        tr:nth-child(even) {
            background-color: #f8fafc;
        }

        tr:hover {
            background-color: #e6f0fa;
        }

        td {
            color: #2d3436;
            font-size: 0.95rem;
        }

        form {
            display: flex;
            gap: 10px;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        input[type="text"] {
            width: 200px;
            padding: 8px;
            border: 1px solid #dfe6e9;
            border-radius: 4px;
            font-size: 0.9rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #002B8D;
            box-shadow: 0 0 0 3px rgba(0, 43, 141, 0.1);
        }

        button {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        button[name="action"][value="approve"] {
            background-color: #FF6600;
            color: white;
        }

        button[name="action"][value="approve"]:hover {
            background-color: #de5900;
            transform: translateY(-2px);
        }

        button[name="action"][value="reject"] {
            background-color: #6c757d;
            color: white;
        }

        button[name="action"][value="reject"]:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            h2 {
                font-size: 1.5rem;
            }

            table {
                font-size: 0.85rem;
            }

            th, td {
                padding: 10px;
            }

            form {
                flex-direction: column;
                gap: 8px;
            }

            input[type="text"] {
                width: 100%;
            }

            button {
                width: 100%;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<h2>Danh sách tour chờ duyệt</h2>

<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Người đặt</th>
            <th>Tour</th>
            <th>Ngày đặt</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="booking" items="${pendingBookings}">
            <tr>
                <td>${booking.id}</td>
                <td>${booking.user.username}</td>
                <td>${booking.tour.name}</td>
                <td>${booking.bookingDate}</td>
                <td>${booking.status}</td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/pendingBookings">
                        <input type="hidden" name="bookingId" value="${booking.id}" />
                        <button type="submit" name="action" value="approve">Duyệt</button>
                        <input type="text" name="rejectionReason" placeholder="Lý do từ chối (nếu có)">
                        <button type="submit" name="action" value="reject">Từ chối</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>