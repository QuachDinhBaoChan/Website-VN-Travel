<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
  .navbar {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    transition: top 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 80px;
    padding: 0 100px;
    background-color: white;
    font-family: Arial, sans-serif;
    border-bottom: 2px solid #ddd;
  }

  .navbar .logo {
    display: flex;
    align-items: center;
  }

  .navbar .logo img {
    height: 60px;
    margin-right: 90px;
  }

  .navbar .nav-links {
    flex: 1;
    display: flex;
    justify-content: center;
    gap: 70px;
  }

  .navbar .nav-links a {
    text-decoration: none;
    font-weight: bold;
    font-size: 14px;
    color: #002B8D;
    transition: color 0.3s ease;
  }

  .navbar .nav-links a:hover {
    color: #FF6600;
  }

  .account-container {
    position: relative;
    display: inline-block;
    font-family: Arial, sans-serif;
    color: #002B8D;
  }

  .account-button {
    cursor: pointer;
    padding: 8px;
    font-size: 15px;
    color: #002B8D;
    display: flex;
    align-items: center;
    gap: 5px;
  }

  .account-dropdown {
    display: none;
    position: absolute;
    right: 0;
    top: 100%;
    background: white;
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 15px;
    width: 220px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    z-index: 999;
  }

  .account-dropdown .login-btn {
    display: block;
    background-color: #002B8D;
    color: white;
    text-align: center;
    padding: 10px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: bold;
    margin-bottom: 10px;
    transition: background-color 0.3s;
  }

  .account-dropdown .login-btn:hover {
    background-color: #FF6600;
  }

  .register-text {
    font-size: 13px;
    color: black;
  }

  .register-text a {
    color: #FF6600;
    text-decoration: none;
    font-weight: bold;
  }

  .register-text a:hover {
    text-decoration: underline;
  }

  .logout-btn {
    background-color: #ccc !important;
    color: black !important;
  }

  /* Dropdown container */
  .dropdown {
    position: relative;
    display: inline-block;
  }

  .dropbtn {
    text-decoration: none;
    font-weight: bold;
    font-size: 14px;
    color: #002B8D;
    transition: color 0.3s ease;
  }

  .dropbtn:hover {
    color: #FF6600;
  }

  /* Dropdown content */
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 180px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.15);
    z-index: 1000;
    border-radius: 8px;
    overflow: hidden;
  }

  .dropdown-content a {
    color: #002B8D;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    font-size: 14px;
    border-bottom: 1px solid #eee;
  }

  .dropdown-content a:last-child {
    border-bottom: none;
  }

  .dropdown-content a:hover {
    background-color: #f2f2f2;
    color: #FF6600;
  }

  /* Show dropdown on hover */
  .dropdown:hover .dropdown-content {
    display: block;
  }

</style>

<nav class="navbar">
  <div class="logo">
    <img src="images/logoVNtourist.png" alt="VTourist Logo" />
  </div>

  <div class="nav-links">
    <a href="index.jsp">TRANG CHỦ</a>
    <div class="dropdown">
      <a href="#" class="dropbtn">TOUR <i class="fa-solid fa-caret-down"></i></a>
      <div class="dropdown-content">
        <a href="touradventure.jsp">Adventure</a>
        <a href="beachTour.jsp">Beach</a>
        <a href="culture.jsp">Cultural</a>
        <a href="nature.jsp">Nature</a>
        <a href="historical.jsp">Historical</a>
        <a href="relaxation.jsp">Relaxation</a>
      </div>
    </div>

    <a href="booking">BOOKING</a>
    <a href="mice.jsp">BLOG - TIN TỨC</a>
  </div>

  <div class="account-container">
    <div class="account-button" onclick="toggleAccountDropdown()">
      <i class="fas fa-user"></i> Tài khoản
    </div>

    <div class="account-dropdown" id="accountDropdown">
      <c:choose>
        <c:when test="${not empty sessionScope.user}">
          <p style="margin-bottom: 10px;">👋 Xin chào, <strong>${sessionScope.user.username}</strong></p>
          <a href="${pageContext.request.contextPath}/bookingHistory" class="login-btn">Xem lịch sử đặt tour</a>
          <a href="${pageContext.request.contextPath}/logout" class="login-btn logout-btn">Đăng xuất</a>
        </c:when>
        <c:otherwise>
          <a href="login.jsp" class="login-btn">Đăng nhập</a>
          <div class="register-text">
            Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a> ngay
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>

<script>
  function toggleAccountDropdown() {
    const dropdown = document.getElementById("accountDropdown");
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
  }

  document.addEventListener("click", function (event) {
    const dropdown = document.getElementById("accountDropdown");
    const button = document.querySelector(".account-button");
    if (!dropdown.contains(event.target) && !button.contains(event.target)) {
      dropdown.style.display = "none";
    }
  });

  // Ẩn navbar khi cuộn xuống, hiện khi cuộn lên
  let lastScrollTop = 0;
  const navbar = document.querySelector(".navbar");

  window.addEventListener("scroll", function () {
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    navbar.style.top = scrollTop > lastScrollTop ? "-100px" : "0";
    lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
  });
</script>
