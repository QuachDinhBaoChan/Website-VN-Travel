<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .search-form {
        flex: 0 0 300px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: #f9f9f9;
        position: sticky; /* Make the form stick during scroll */
        top: 140px; /* Stick 20px from the top of the viewport */
        z-index: 10; /* Ensure form stays above other content */
    }

    .search-form label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .search-form select,
    .search-form input[type="date"],
    .search-form input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .search-form .days-options {
        margin-bottom: 10px;
    }

    .search-form .custom-days {
        display: none;
        margin-top: 10px;
    }

    .search-form input[type="range"] {
        width: 100%;
        margin: 10px 0;
    }

    .search-form button {
        background-color: #ff5722;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
    }

    .search-form button:hover {
        background-color: #e64a19;
    }
</style>

<script>
    function toggleCustomDays() {
        var customDays = document.getElementById("customDays");
        var daysSelect = document.getElementById("daysRange");
        customDays.style.display = daysSelect.value === "Khác" ? "block" : "none";
    }
</script>

<div class="search-form">
    <form method="post" action="${pageContext.request.contextPath}/searchTour">
        <label for="departureLocation">Điểm khởi hành:</label>
        <select name="departureLocation" id="departureLocation">
            <option value="">Chọn điểm khởi hành</option>
            <option value="Da Nang">Đà Nẵng</option>
            <option value="Ho Chi Minh City">TP. Hồ Chí Minh</option>
            <option value="Ha Noi">Hà Nội</option>
        </select>

        <label for="destination">Điểm đến:</label>
        <select name="destination" id="destination">
            <option value="">Chọn điểm đến</option>
            <option value="Ba Na Hills">Ba Na Hills</option>
            <option value="Hoi An">Hội An</option>
            <option value="Sun Wheel">Sun Wheel</option>
            <option value="Ha Long Bay">Hạ Long Bay</option>
            <option value="Phu Quoc">Phú Quốc</option>
            <option value="Da Lat">Đà Lạt</option>
            <option value="Mui Ne">Mũi Né</option>
            <option value="Nha Trang">Nha Trang</option>
            <option value="Sapa">Sa Pa</option>
            <option value="Phong Nha">Phong Nha</option>
            <option value="Can Tho">Cần Thơ</option>
            <option value="Hue">Huế</option>
            <option value="Con Dao">Côn Đảo</option>
            <option value="Tam Dao">Tam Đảo</option>
            <option value="Quy Nhon">Quy Nhơn</option>
            <option value="My Son">Mỹ Sơn</option>
        </select>

        <label for="departureDate">Ngày khởi hành:</label>
        <input type="date" name="departureDate" id="departureDate" min="2025-06-17">

        <label>Số ngày:</label>
        <div class="days-options">
            <select name="daysRange" id="daysRange" onchange="toggleCustomDays()">
                <option value="">Chọn số ngày</option>
                <option value="1-4">1-4 ngày</option>
                <option value="5-8">5-8 ngày</option>
                <option value="9-12">9-12 ngày</option>
                <option value="14+">Trên 14 ngày</option>
                <option value="Khác">Khác...</option>
            </select>
            <div id="customDays" class="custom-days">
                <input type="text" name="customDaysInput" placeholder="Nhập số ngày">
            </div>
        </div>

        <label>Ngân sách (USD):</label>
        <input type="range" name="budget" id="budget" min="0" max="500" value="250" oninput="this.nextElementSibling.value = this.value">
        <output>250</output> USD

        <button type="submit">Tìm kiếm Tour</button>
    </form>
</div>