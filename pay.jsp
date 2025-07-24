<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Kết quả thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <!-- Tự động chuyển hướng sau 5 giây nếu thành công -->
    <c:if test="${success eq true}">
        <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/bookingHistory"/>
    </c:if>
</head>
<body class="bg-gradient-to-br from-blue-900 to-orange-500 min-h-screen flex items-center justify-center font-sans">

<div class="bg-white p-10 rounded-2xl shadow-2xl w-full max-w-md text-center animate-fade-in">
    <h2 class="text-3xl font-bold text-blue-900 mb-4 tracking-wide">Kết quả thanh toán</h2>

    <c:choose>
        <c:when test="${success eq true}">
            <div class="text-green-600 text-lg font-medium flex flex-col items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 mb-3 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                ✅ Thanh toán thành công!<br />
                <span class="text-sm text-gray-500 mt-1">Đang chuyển về lịch sử đặt tour... .  .</span>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-red-600 text-lg font-medium flex flex-col items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 mb-3 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
                ❌ <c:out value="${error != null ? error : 'Đã có lỗi xảy ra.'}" />
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Hiệu ứng fade-in -->
<style>
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .animate-fade-in {
        animation: fadeIn 0.7s ease-in-out;
    }
</style>

</body>
</html>
