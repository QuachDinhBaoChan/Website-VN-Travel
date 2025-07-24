<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  .footer {
    background-color: #f9f9f9;
    padding: 40px 80px;
    font-family: Arial, sans-serif;
    color: #002B8D;
    border-top: 1px solid #ccc;
  }

  .footer .footer-columns {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    gap: 20px;
  }

  .footer .footer-column {
    flex: 1 1 200px;
    margin: 20px 10px;
    min-width: 180px;
    text-align: left;
  }

  .footer .footer-column h3 {
    color: #002B8D;
    font-size: 16px;
    border-bottom: 2px solid #002B8D;
    padding-bottom: 8px;
    margin-bottom: 15px;
  }

  .footer .footer-column p,
  .footer .footer-column a {
    color: #002B8D;
    text-decoration: none;
    font-size: 14px;
    display: block;
    margin: 8px 0;
  }

  .footer .footer-column a:hover {
    color: #FF6600;
    text-decoration: underline;
  }

  .social-icons {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap:15px;
  }

  .social-icons a {
    margin-right: 15px;
    color: #002B8D;
    font-size: 24px;
    transition: transform 0.2s;
  }

  .social-icons a:hover {
    color: #FF6600;
    transform: scale(1.2);
  }

  .subscribe-box {
    display: flex;
    margin-top: 10px;
  }

  .subscribe-box input[type="email"] {
    padding: 8px;
    width: 150px;
    border: 1px solid #ccc;
    border-radius: 4px 0 0 4px;
    font-size: 14px;
  }

  .subscribe-box button {
    padding: 5px 5px;
    background-color: #FF6600;
    color: white;
    border: none;
    border-radius: 0 4px 4px 0;
    cursor: pointer;
    font-size: 14px;
  }

  .subscribe-box button:hover {
    background-color: #e65c00;
  }

  .payment-icons img {
    height: 28px;
    margin: 8px 8px 8px 0;
  }

  .map-container {
    margin-top: 20px;
  }

  .map-container iframe {
    border: 0;
    width: 680px;
    height: 250px;
    border-radius: 10px;
  }

  @media (max-width: 768px) {
    .footer {
      padding: 20px 40px;
    }
    .footer-column {
      flex: 1 1 100%;
      margin: 15px 0;
    }
    .subscribe-box input[type="email"] {
      width: 100%;
    }
    .social-icons {
      display: flex;
      flex-direction: row;
      align-items: center;
      gap:10px;
    }
    .social-icons a {
      margin-right: 12px;
    }
    .map-container iframe {
      height: 150px;
    }

</style>

<footer class="footer">
  <div class="footer-columns">
    <!-- Company Logo -->
    <div class="footer-column">
      <img src="${pageContext.request.contextPath}/images/logoVNtourist.png" alt="Logo" style="height: 80px; margin-bottom: 15px;">
    </div>

    <!-- Contact, Social Media, and Map -->
    <div class="footer-column">
      <h3>LIÊN HỆ</h3>
      <p>CÔNG TY CỔ PHẦN DU LỊCH VTOURIST</p>
      <p>123 Trần Đại Nghĩa, Ngũ Hành Sơn, Tp. Đà Nẵng</p>
      <p>Email: info@vntourist.com.vn</p>
      <p>Hotline: 0999888777</p>
      <div class="social-icons">
        <a href="https://www.facebook.com/groups/512037848808377"><i class="fab fa-facebook-f"></i></a>
        <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-whatsapp"></i></a>
        <a href="https://www.youtube.com/watch?v=wO5hfqSUocE"><i class="fab fa-youtube"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
      </div>

    </div>

    <!-- About Us -->
    <div class="footer-column">
      <h3>VỀ CHÚNG TÔI</h3>
      <a href="#">Giới thiệu</a>
      <a href="#">Liên hệ</a>
    </div>

    <!-- Policies -->
    <div class="footer-column">
      <h3>CHÍNH SÁCH</h3>
      <a href="#">Chính Sách Dịch Vụ Trong Chuyến Đi</a>
      <a href="#">Quy Định Thanh Toán</a>
      <a href="#">Đặt Và Xác Nhận Dịch Vụ</a>
      <a href="#">Quy Chế Hoạt Động</a>
      <a href="#">Chính Sách Đổi Trả Và Hoàn Tiền</a>
    </div>

    <!-- Subscription and Payment -->
    <div class="footer-column">
      <h3>ĐĂNG KÝ NHẬN TIN</h3>
      <p>Chia sẻ liên hệ với chúng tôi để nhận thêm thông tin về tour và ưu đãi!</p>
      <div class="subscribe-box">
        <input type="email" placeholder="Địa chỉ Email">
        <button>Gửi ngay!</button>
      </div>

      <h3 style="margin-top: 20px;">CHẤP NHẬN THANH TOÁN</h3>
      <div class="payment-icons">
        <span><img src="images/mtrcard.png" alt="Mastercard" /></span>
        <span><img src="images/vscard.png" alt="Visa" /></span>
        <img src="images/viettin.png" alt="Viettin" />
        <img src="images/Logo-Agribank.png" alt="Agribank" />
        <img src="images/msb.png" alt="MSB" />
      </div>
    </div>
  </div>
</footer>